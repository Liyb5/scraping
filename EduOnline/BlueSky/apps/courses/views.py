from django.shortcuts import render,HttpResponse
from django.views import View
from django.db.models import Q

from .models import *
from operation.models import UserFavorite,CourseComments,UserCourse

from pure_pagination import EmptyPage,Paginator,PageNotAnInteger

from utils.mixin_utils import LoginRequiredMixin


class CourseListView(View):
    def get(self,request):
        courses = Course.objects.all().order_by('-add_time')

        hot_courses = Course.objects.all().order_by('-click_nums')[:3]

        #搜索功能
        search_kwargs = request.GET.get('keywords','')
        if search_kwargs:
            courses = courses.filter(Q(name__icontains=search_kwargs)|Q(desc__icontains=search_kwargs)|Q(detail__icontains=search_kwargs))

        # 排序：热门按点击数,参与人数即学生数
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                courses = courses.order_by('-students')
            elif sort == 'click_nums':
                courses = courses.order_by('-click_nums')

        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(courses, 3, request=request)
            cour = p.page(page)
        except PageNotAnInteger:
            cour = p.page(1)
        except EmptyPage:
            cour = p.page(1)

        context = {
            'courses':cour,
            'sort':sort,
            'hot_courses':hot_courses
        }
        return render(request,'course-list.html',context=context)

class DetailView(View):
    '''
    课程详情
    '''
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))

        #点击后点击数加一
        course.click_nums += 1
        course.save()

        #相关课程
        tag = course.tag
        if tag:
            #表示Course表中，tag为tag，id不是本课程id
            relative_courses = Course.objects.filter(~Q(id=course.id),tag =tag)[:2]
        else:
            relative_courses = []

        #收藏/已收藏
        fav_course = fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                fav_org = True

        context = {
            'course':course,
            'relative_courses':relative_courses,

            'fav_course':fav_course,
            'fav_org':fav_org
        }
        return render(request,'course-detail.html',context=context)

class VideoView(View):
    '''
    视频播放
    '''
    def get(self,request,video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        course.students += 1
        course.save()
        current_resources = CourseResource.objects.filter(course=course)

        # 查询用户是否关联该课程
        users_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not users_courses:
            UserCourse.objects.create(user=request.user, course=course)

        users_courses = UserCourse.objects.filter(course=course)  # 学过该课程的Usercourse
        users_ids = [user_course.user_id for user_course in users_courses]
        courseids = [course.course_id for course in users_courses]
        relative_courses = Course.objects.filter(id__in=courseids).order_by('-click_nums')[:3]

        context = {
            'course':course,
            'current_resources':current_resources,
            'relative_courses':relative_courses,
            'video':video
        }
        return render(request,'course-play.html',context=context)


class InfoView(LoginRequiredMixin,View):
    '''
    视频信息
    '''
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.students += 1
        course.save()
        current_resources = CourseResource.objects.filter(course=course)

        # 查询用户是否关联该课程
        users_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not users_courses:
            UserCourse.objects.create(user=request.user, course=course)

        users_courses = UserCourse.objects.filter(course=course)  # 学过该课程的Usercourse
        users_ids = [user_course.user_id for user_course in users_courses]
        courseids = [course.course_id for course in users_courses]
        relative_courses = Course.objects.filter(id__in=courseids).order_by('-click_nums')[:3]

        context = {
            'course':course,
            'current_resources':current_resources,
            'relative_courses':relative_courses
        }
        return render(request,'course-video.html',context=context)

class CommentView(LoginRequiredMixin,View):
    '''
    课程评论
    '''
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        current_resources = CourseResource.objects.filter(course=course)

        users_courses = UserCourse.objects.filter(course=course)  # 学过该课程的Usercourse
        users_ids = [user_course.user_id for user_course in users_courses]
        courseids = [course.course_id for course in users_courses]
        relative_courses = Course.objects.filter(id__in=courseids).order_by('-click_nums')[:3]

        context = {
            # 'current_comments':current_comments,
            'course':course,
            'current_resources':current_resources,
            'relative_courses':relative_courses
        }
        return render(request,'course-comment.html',context=context)

class AddComment(View):
    '''
    添加评论
    '''
    def post(self,request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get('course_id',0)
        comments = request.POST.get('comments','')
        if int(course_id) > 0 and comments:
            usercomment = CourseComments()
            usercomment.user = request.user
            usercomment.comments = comments
            usercomment.course_id = int(course_id)
            usercomment.save()
            return HttpResponse('{"status":"success","msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":"添加失败"}', content_type='application/json')
