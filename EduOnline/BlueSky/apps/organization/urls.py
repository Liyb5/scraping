from django.conf.urls import url,include
from .views import *

urlpatterns = [
    url(r'^list/$', OrgView.as_view(), name='orglist'),
    url(r'^add_ask/$',AddUserAsk.as_view(),name='addask'),
    url(r'^home/(?P<org_id>\d+)/$',OrgHomeView.as_view(),name='home'),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(), name='course'),
    url(r'^desc/(?P<org_id>\d+)/$',OrgDescView.as_view(),name='desc'),
    url(r'^teachers/(?P<org_id>\d+)/$',OrgTeachersView.as_view(),name='teachers'),

    #课程机构收藏
    url(r'^favorite/$', Favorite.as_view(), name='favorite'),

    #课程教师
    url(r'^teacher/list/$',TeacherView.as_view(),name='teacherlist'),

    #教师详情
    url(r'^teacher/detail/(?P<teacher_id>\d+)/$',TeacherDetailView.as_view(),name='teacherdetail'),
]