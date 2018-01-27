from django.shortcuts import render,redirect,HttpResponse
from django.contrib import auth
from django.views import View
from .forms import *

from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin #进入用户个人信息时，必须要登录

from django.contrib.auth.hashers import make_password
#对用户注册的密码的明文进行加密

#设置认证方式：账号，密码和邮箱密码
from .models import UserProfile,EmailVerifyRecord,Banner
from django.db.models import Q
from django.contrib.auth.backends import ModelBackend

import json

from operation.models import UserCourse,UserFavorite,UserMessage
from organization.models import CourseOrg,Teacher
from courses.models import Course

class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except:
            return None

class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'register.html',{'register_form':register_form})
    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            u = request.POST.get('email')
            p = request.POST.get('password')
            user_profile = UserProfile()
            if UserProfile.objects.filter(email=u):
                return render(request, 'register.html', {'msg': '用户已注册'})
            else:
                user_profile.username = u
                user_profile.email = u
                user_profile.is_active = False
                user_profile.password = make_password(p)
                user_profile.save()

                #用户注册后，生成消息
                user_msg = UserMessage()
                user_msg.user = user_profile.id
                user_msg.message = '欢迎注册！'
                user_msg.save()

                send_register_email(u,'register')
                return render(request, 'login.html')
        else:
            return render(request,'register.html',{'register_form':register_form})

class ActiveView(View):
    def get(self,request,active_code):
        email_record = EmailVerifyRecord.objects.filter(code=active_code)
        #注意此时email_record是对象集合，只有一行数据就是只有一个对象的列表
        if email_record:
            user = UserProfile.objects.get(email=email_record[0].email)
            user.is_active = True
            user.save()
        else:
            return render(request,'active_fail.html')
        return render(request, 'login.html')

class LoginView(View):
    def get(self,request):
        return render(request, 'login.html', {})

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            #验证登陆字符是否有效
            u = request.POST.get('username')
            p = request.POST.get('password')
            user = auth.authenticate(username=u, password=p)
            if user:
                if user.is_active:
                    auth.login(request, user)
                    return redirect(to='index')
                else:
                    return render(request, 'login.html', {'msg': '您还未激活'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'login_form':login_form})

class LogoutView(View):
    '''
    django中auth既有登录login功能，又有退出logout功能
    '''
    def get(self,request):
        auth.logout(request)
        return redirect(to='index') #此处用重定向,和在html中用法一样，如to='org:orglist'

class ForgetPwdView(View):
    def get(self,request):
        forget_pwd_form = ForgetPwdForm()
        return render(request,'forgetpwd.html',{'forget_pwd_form':forget_pwd_form})
    def post(self,request):
        forget_pwd_form = ForgetPwdForm(request.POST)
        if forget_pwd_form.is_valid():
            email = request.POST.get('email')
            send_register_email(email, 'forget')
            return render(request,'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forget_pwd_form': forget_pwd_form})

class ResetView(View):
    def get(self,request,active_code):
        email_record = EmailVerifyRecord.objects.filter(code=active_code)
        #注意此时email_record是对象集合，只有一行数据就是只有一个对象的列表
        if email_record:
            email = email_record[0].email
            return render(request, 'password_reset.html',{'active_code':active_code,'email':email})
        else:
            return render(request,'active_fail.html')
    def post(self,request,active_code):
        resetpwd_form = ResetpwdForm(request.POST)
        email = request.POST.get('email')
        if resetpwd_form.is_valid():
            pwd = request.POST.get('password')
            pwd2 = request.POST.get('password2')
            if pwd == pwd2:
                user = UserProfile.objects.get(email=email)
                user.password = make_password(pwd)
                user.save()
                return render(request, 'login.html')
            else:
                return render(request, 'password_reset.html', {'active_code':active_code,'email':email,'msg': '两次输入不一致 ！'})
        else:
            return render(request, 'password_reset.html', {'active_code':active_code,'email': email, 'resetpwd_form': resetpwd_form})


class UserInfoView(LoginRequiredMixin,View):
    '''
    用户个人信息显示（get）；表单提交（post）
    '''
    def get(self,request):
        context = {}
        return render(request,'usercenter-info.html',context=context)
    def post(self,request):
        userinfo = UserInfoForm(request.POST,instance=request.user) #因为是修改而不是添加新数据，所以要指明实例，即修改哪个用户的信息
        if userinfo.is_valid():
            userinfo.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        return HttpResponse(json.dumps(userinfo.errors), content_type='application/json')

class ImageUploadView(LoginRequiredMixin,View):
    '''
    用户头像上传
    '''
    def post(self,request):
        image_upload_form = ImageUploadForm(request.POST,request.FILES,instance=request.user) #文件类型在request.FILES中
        print(type(request.user))
        if image_upload_form.is_valid():
            image_upload_form.save()    #在ImageUploadForm设置instance为request.user即用户实例后，只要image_upload_form有效，这里直接save就可保存图像修改
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class UpdatePwdView(View):
    '''
    在个人信息修改密码
    '''
    def post(self,request):
        resetpwd_form = ResetpwdForm(request.POST)
        if resetpwd_form.is_valid():
            pwd = request.POST.get('password')
            pwd2 = request.POST.get('password2')
            if pwd == pwd2:
                user = request.user
                user.password = make_password(pwd)
                user.save()
                return HttpResponse('{"status":"success"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"两次输入不一致"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(resetpwd_form.errors), content_type='application/json')

class SendcodeUpdateEmail(LoginRequiredMixin,View):
    '''
    在用户信息中，向用户准备修改的邮箱中发送验证码（get），修改邮箱（post）
    '''
    def get(self,request):
        email = request.GET.get('email','')
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在"}', content_type='application/json')
        send_register_email(email, 'update_email')
        return HttpResponse('{"status":"success"}', content_type='application/json')
    def post(self,request):
        email = request.POST.get('email', '')
        code = request.POST.get('code','')
        exists_records= EmailVerifyRecord.objects.filter(email=email,code=code,send_type='update_email')
        if exists_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码错误"}', content_type='application/json')

class MyCourseView(View):
    '''
    我的课程
    '''
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        context = {
            'user_courses':user_courses
        }
        return render(request,'usercenter-mycourse.html',context=context)

class MyFavOrgView(View):
    '''
    我的收藏：机构
    '''
    def get(self,request):
        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=2)
        org_ids = [i.fav_id for i in user_favs]
        all_orgs = CourseOrg.objects.filter(id__in=org_ids)
        context = {
            'all_orgs':all_orgs
        }
        return render(request,'usercenter-fav-org.html',context=context)

class MyFavTeacherView(View):
    '''
    我的收藏：教师
    '''
    def get(self,request):
        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=3)
        teacher_ids = [i.fav_id for i in user_favs]
        all_teachers = Teacher.objects.filter(id__in=teacher_ids)
        context = {
            'all_teachers':all_teachers
        }
        return render(request,'usercenter-fav-teacher.html',context=context)

class MyFavCourseView(View):
    '''
    我的收藏：课程
    '''
    def get(self,request):
        user_favs = UserFavorite.objects.filter(user=request.user,fav_type=1)
        course_ids = [i.fav_id for i in user_favs]
        all_courses = Course.objects.filter(id__in=course_ids)
        context = {
            'all_courses':all_courses
        }
        return render(request,'usercenter-fav-course.html',context=context)


from pure_pagination import Paginator,PageNotAnInteger,EmptyPage
class MyMsgView(LoginRequiredMixin,View):
    '''
    我的消息
    '''
    def get(self,request):
        user_msg = UserMessage.objects.filter(user=request.user.id)

        have_no_read = user_msg.filter(has_read=False)
        for i in have_no_read:
            i.has_read = True
            i.save()

        # 对消息进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(user_msg, 2, request=request)
            msgs = p.page(page)
        except PageNotAnInteger:
            msgs = p.page(1)
        except EmptyPage:
            msgs = p.page(1)

        context = {
            'user_msg':msgs
        }
        return render(request,'usercenter-message.html',context=context)


class IndexView(View):
    '''
    首页
    '''
    def get(self,request):
        banners = Banner.objects.all().order_by('index')[:5]
        course_banners = Course.objects.filter(is_banner=True)[:3]
        courses = Course.objects.filter(is_banner=False)[:6]
        course_orgs = CourseOrg.objects.all()[:15]
        context={
            'banners':banners,
            'course_banners':course_banners,
            'courses':courses,
            'course_orgs':course_orgs
        }
        return render(request,'index.html',context=context)


def page_not_found_404(request):
    '''
    全局404处理函数
    '''
    from django.shortcuts import render_to_response
    context = {}
    response = render_to_response('404.html',context=context)
    response.status_code = 404
    return response

def page_error_500(request):
    '''
    全局500处理函数
    '''
    from django.shortcuts import render_to_response
    context = {}
    response = render_to_response('500.html',context=context)
    response.status_code = 500
    return response

