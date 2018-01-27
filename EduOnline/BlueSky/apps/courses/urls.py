from django.conf.urls import url

from .views import *

urlpatterns = [
    # 课程列表
    url(r'^list/$', CourseListView.as_view(), name='list'),
    # 课程详情
    url(r'^detail/(?P<course_id>\d+)/$', DetailView.as_view(), name='detail'),
    # 视频信息
    url(r'^info/(?P<course_id>\d+)/$', InfoView.as_view(), name='info'),
    # 课程评论
    url(r'^comment/(?P<course_id>\d+)/$', CommentView.as_view(), name='comment'),
    # 添加评论
    url(r'^addcomment/$', AddComment.as_view(), name='addcomment'),
    #video
    url(r'^video/(?P<video_id>\d+)/$', VideoView.as_view(), name='video'),
]
