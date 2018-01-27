from django.shortcuts import render
from django.http import HttpResponse
from django.views import View
from django.db.models import Q

from .models import *
from operation.models import UserFavorite

from pure_pagination import *

from .forms import UserAskForm

from courses.models import Course

class OrgView(View):
    def get(self,request):
        all_orgs = CourseOrg.objects.all()
        all_cities = CityDict.objects.all()
        hot_orgs = all_orgs.order_by('-click_nums')[:3]

        #筛选城市
        city_id = request.GET.get('city','')
        #city_id 是str
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))

        #筛选机构
        category = request.GET.get('ct', '')
        if category:
            all_orgs = CourseOrg.objects.filter(category=category)

        # 搜索功能
        search_kwargs = request.GET.get('keywords', '')
        if search_kwargs:
            all_orgs = all_orgs.filter(Q(name__icontains=search_kwargs) | Q(desc__icontains=search_kwargs))

        #学习人数,课程数
        sort = request.GET.get('sort','')
        if sort:
            if sort == 'students':
                all_orgs = all_orgs.order_by('-students')
            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-courses')

        #对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_orgs, 5, request=request)
            orgs = p.page(page)
        except PageNotAnInteger:
            orgs = p.page(1)
        except EmptyPage:
            orgs = p.page(1)

        all_nums = all_orgs.count()
        context = {
            'all_orgs':orgs,
            'all_cities':all_cities,
            'all_nums':all_nums,
            'city_id':city_id,
            'category':category,
            'hot_orgs':hot_orgs,
            'sort':sort
        }
        return render(request,'org-list.html',context=context)

class AddUserAsk(View):
    '''
    用户添加咨询
    '''
    def post(self,request):
        ask_form = UserAskForm(request.POST)
        if ask_form.is_valid():
            user_ask = ask_form.save(commit=True)
            #注意json写法
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加出错"}',content_type='application/json')

class OrgHomeView(View):
    '''
    机构首页
    '''
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums += 1
        course_org.save()

        #收藏判断
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course_org.id,fav_type=2):
                has_fav = True

        all_courses = course_org.course_set.all()[:3]
        #django的orm用法，course和courseorg有外键关系，这样可以取出该机构下所有的课程
        all_teachers = course_org.teacher_set.all()[:2]
        context = {
            'all_courses':all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':'home',
            'has_fav':has_fav
        }
        return render(request,'org-detail-homepage.html',context=context)

class OrgCourseView(View):
    '''
    机构课程
    '''
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))

        # 收藏判断
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        all_courses = course_org.course_set.all()
        context = {
            'all_courses':all_courses,
            'course_org':course_org,
            'current_page': 'course',
            'has_fav':has_fav
        }
        return render(request,'org-detail-course.html',context=context)

class OrgDescView(View):
    '''
    机构介绍
    '''
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))

        # 收藏判断
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        context = {
            'course_org':course_org,
            'current_page': 'desc',
            'has_fav':has_fav
        }
        return render(request,'org-detail-desc.html',context=context)

class OrgTeachersView(View):
    '''
    机构讲师
    '''
    def get(self,request,org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))

        # 收藏判断
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True

        all_teachers = course_org.teacher_set.all()
        context = {
            'course_org':course_org,
            'all_teachers':all_teachers,
            'current_page': 'teacher',
            'has_fav':has_fav
        }
        return render(request,'org-detail-teachers.html',context=context)


class Favorite(View):
    '''
    用户收藏 or 取消收藏
    '''
    def post(self,request):
        fav_id = request.POST.get('fav_id',0)
        fav_type = request.POST.get('fav_type',0)

        #先判断用户是否登录
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')

        exit_records = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))

        #如果记录存在，用户点击就表示取消收藏，这里就删除收藏记录;如果记录不存在，就保存记录。
        if exit_records:
            exit_records.delete()

            #课程 机构 教师 收藏数减一
            if int(fav_type) == 1:
                course_fav  = Course.objects.get(id = int(fav_id))
                course_fav.fav_nums -= 1
                if course_fav.fav_nums < 1: #避免出现负数
                    course_fav.fav_nums = 0
                course_fav.save()
            elif int(fav_type) == 2:
                org_fav = CourseOrg.objects.get(id=int(fav_id))
                org_fav.fav_nums -= 1
                if org_fav.fav_nums < 1: #避免出现负数
                    org_fav.fav_nums = 0
                org_fav.save()
            elif int(fav_type) == 3:
                tea_fav = Teacher.objects.get(id=int(fav_id))
                tea_fav.fav_nums -= 1
                if tea_fav.fav_nums < 1: #避免出现负数
                    tea_fav.fav_nums = 0
                tea_fav.save()

            return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
        else:
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav = UserFavorite()
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                # 课程 机构 教师 收藏数加一
                if int(fav_type) == 1:
                    course_fav = Course.objects.get(id=int(fav_id))
                    course_fav.fav_nums += 1
                    course_fav.save()
                elif int(fav_type) == 2:
                    org_fav = CourseOrg.objects.get(id=int(fav_id))
                    org_fav.fav_nums += 1
                    org_fav.save()
                elif int(fav_type) == 3:
                    tea_fav = Teacher.objects.get(id=int(fav_id))
                    tea_fav.fav_nums += 1
                    tea_fav.save()

                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type='application/json')


class TeacherView(View):
    '''
    课程教师
    '''
    def get(self,request):
        all_teachers = Teacher.objects.all()
        hot_teachers = all_teachers.order_by('-fav_nums')[:3]

        sort = request.GET.get('sort','')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        # 搜索功能
        search_kwargs = request.GET.get('keywords', '')
        if search_kwargs:
            all_teachers = all_teachers.filter(Q(name__icontains=search_kwargs) | Q(work_company__icontains=search_kwargs))

        # 对教师进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_teachers, 5, request=request)
            teas = p.page(page)
        except PageNotAnInteger:
            teas = p.page(1)
        except EmptyPage:
            teas = p.page(1)

        all_nums = all_teachers.count()
        context = {
            'all_teachers':teas,
            'sort':sort,
            'all_nums':all_nums,
            'hot_teachers':hot_teachers
        }
        return render(request,'teachers-list.html',context=context)


class TeacherDetailView(View):
    '''
    教师详情
    '''
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()
        hot_teachers = Teacher.objects.order_by('-click_nums')[:3]

        # 收藏/已收藏
        fav_teacher = fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                fav_teacher = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.org_id, fav_type=2):
                fav_org = True

        context = {
            'teacher':teacher,
            'hot_teachers':hot_teachers,
            'fav_teacher':fav_teacher,
            'fav_org':fav_org
        }
        return render(request,'teacher-detail.html',context=context)
