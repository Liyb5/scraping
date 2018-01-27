from datetime import datetime

from django.db import models

class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name='城市')
    desc = models.CharField(max_length=200, verbose_name='描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '城市'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name

class CourseOrg(models.Model):
    name = models.CharField(max_length=50,verbose_name='机构名称')
    category = models.CharField(max_length=20,choices=(('pxjg','培训机构'),('gr','个人'),('gx','高校')),default='pxjg',verbose_name='机构类别')
    desc = models.TextField(verbose_name='机构描述')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    students = models.IntegerField(default=0, verbose_name='学习人数')
    courses = models.IntegerField(default=0, verbose_name='课程数')
    image = models.ImageField(upload_to='org/%Y/%m', verbose_name='LOGO', max_length=100)
    address = models.CharField(max_length=150, verbose_name='机构地址')
    city = models.ForeignKey(CityDict,verbose_name='所在城市')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    tag = models.CharField(max_length=20,default='实事求是',verbose_name='标签')

    class Meta:
        verbose_name = '课程机构'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
    def get_classic_course(self):
        courses = self.course_set.all().order_by('-students')[:2]
        return courses

class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name='所属机构')
    name = models.CharField(max_length=50, verbose_name='教师名')
    age = models.IntegerField(default=0,verbose_name='年龄')
    work_years = models.IntegerField(default=0,verbose_name='工作年限')
    work_company = models.CharField(max_length=50,verbose_name='就职公司')
    work_position = models.CharField(max_length=50,verbose_name='公司职位')
    image = models.ImageField(upload_to='teacher/%Y/%m', verbose_name='头像', max_length=100,default='')
    points = models.CharField(max_length=50,verbose_name='教学特点')
    click_nums = models.IntegerField(default=0, verbose_name='点击数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '教师'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name


