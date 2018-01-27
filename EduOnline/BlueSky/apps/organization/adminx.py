from .models import *
import xadmin

class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']
    relfield_style = 'fk-ajax'  #数据量大时使用该功能，采用ajax方式加载

class CourseOrgAdmin(object):
    list_display = ['name', 'click_nums','fav_nums','image','address','city','add_time']
    search_fields = ['name', 'desc', 'click_nums','fav_nums','image','address','city']
    list_filter = ['name', 'desc', 'click_nums','fav_nums','image','address','city__name','add_time']
    ordering = ('-click_nums',) #设置后台默认排序
    readonly_fields = ['click_nums','image'] #设置只读字段
    exclude = ['fav_nums']


class TeacherAdmin(object):
    list_display = ['org', 'name','work_years','work_company',
                    'work_position','click_nums','fav_nums','add_time']
    search_fields = ['org', 'name','work_years','work_company',
                    'work_position','points','click_nums','fav_nums']
    list_filter = ['org__name', 'name','work_years','work_company',
                    'work_position','points','click_nums','fav_nums','add_time']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
