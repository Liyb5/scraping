from .models import *
import xadmin

class LessonInline(object):
    model = Lesson
    extra = 0

class CourseResourceInline(object):
    model = CourseResource
    extra = 0

class CourseAdmin(object):
    list_display = ['name', 'degree', 'times', 'students','fav_nums','click_nums','add_time','get_lesson_nums','go_to']
    search_fields = ['name', 'degree', 'times', 'students','fav_nums','click_nums']
    list_filter = ['name', 'degree', 'times', 'students','fav_nums','click_nums','add_time']
    readonly_fields = ['image']
    inlines = [LessonInline,CourseResourceInline]
    list_editable = ['degree']
    # refresh_times = [3,5]#自动刷新

    style_fields = {'detail':'ueditor'}

    import_excel = True

    def queryset(self):
        qs = super(CourseAdmin,self).queryset()
        return qs.filter(is_banner=False)

    def save_models(self):
        obj=self.new_obj
        obj.save()
        if obj.course_org:
            course_org = obj.course_org
            course_org.courses = Course.objects.filter(course_org=course_org).count()
            course_org.save()

    def post(self,request,*args,**kwargs):
        if 'excel' in request.FILES:
            pass
        return  super(CourseAdmin,self).post(request,*args,**kwargs)


class BannerCourseAdmin(object):
    list_display = ['name', 'degree', 'times', 'students','fav_nums','click_nums','add_time']
    search_fields = ['name', 'degree', 'times', 'students','fav_nums','click_nums']
    list_filter = ['name', 'degree', 'times', 'students','fav_nums','click_nums','add_time']
    readonly_fields = ['image']
    inlines = [LessonInline,CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin,self).queryset()
        return qs.filter(is_banner=True)

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']

class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']

class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course__name', 'name', 'download', 'add_time']

xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(BannerCourse,BannerCourseAdmin)

xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)