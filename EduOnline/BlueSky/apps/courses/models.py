from datetime import datetime

from django.db import models

from organization.models import CourseOrg,Teacher

from DjangoUeditor.models import UEditorField

class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,null=True,blank=True,verbose_name='课程机构')
    name = models.CharField(max_length=50,verbose_name='课程名')
    desc = models.CharField(max_length=300,verbose_name='课程描述')

    # detail = models.TextField(verbose_name='课程详情')
    detail = UEditorField(verbose_name='课程详情',width=600, height=300, imagePath="courses/ueditor/", filePath="courses/ueditor/",default='')

    degree = models.CharField(verbose_name='难度',max_length=5,choices=(('cj','初级'),('zj','中级'),('gj','高级')))
    #注意在模版中显示中文时用：get_degree_display

    teacher = models.ForeignKey(Teacher,null=True,blank=True,verbose_name='课程教师')

    is_banner = models.BooleanField(default=False,verbose_name='课程是否轮播')

    you_need_to_know = models.CharField(max_length=300,verbose_name='课程须知',default='')
    you_can_learn = models.CharField(max_length=300,verbose_name='你能学到的技能',default='')

    category = models.CharField(default='后端开发',verbose_name='课程类别',max_length=20)
    times = models.IntegerField(default=0,verbose_name='学习时长(分钟数)')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m',verbose_name='封面图',max_length=100)
    click_nums = models.IntegerField(default=0,verbose_name='点击数')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    tag = models.CharField(default='',verbose_name='标签',max_length=10)

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_lesson_nums(self):
        #可在adminx添加，在后台作为字段显示
        return self.lesson_set.all().count()
    get_lesson_nums.short_description = '章节数'

    def go_to(self):
        #同上一样操作，但在后台作为跳转
        from django.utils.safestring import mark_safe
        return mark_safe('<a href="http://www.baidu.com">跳转</a>')
    go_to.short_description = '跳转'

class BannerCourse(Course):
    class Meta:
        verbose_name = '轮播课程'
        verbose_name_plural = verbose_name
        proxy = True

class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='章节名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name='章节')
    name = models.CharField(max_length=100, verbose_name='视频名')
    url = models.CharField(default='',max_length=200,verbose_name='视频地址')
    times = models.IntegerField(default=0, verbose_name='学习时长(分钟数)')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='名称')
    download = models.FileField(upload_to='course/resource/%Y%m',verbose_name='资源文件',max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


