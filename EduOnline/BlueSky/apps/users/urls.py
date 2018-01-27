from django.conf.urls import url

from .views import UserInfoView,ImageUploadView,UpdatePwdView,\
    SendcodeUpdateEmail,MyCourseView,MyFavOrgView,MyFavTeacherView,MyFavCourseView,MyMsgView

urlpatterns = [
    #用户个人资料
    url('^info/$',UserInfoView.as_view(),name='info'),

    #用户头像
    url('^image_upload/$',ImageUploadView.as_view(),name='image_upload'),

    #用户个人资料中修改密码
    url('^updatepwd/$',UpdatePwdView.as_view(),name='updatepwd'),

    #在用户资料中，向用户准备修改的邮箱中发送验证码（get），修改邮箱（post）
    url('^sendcode_updateemail/$',SendcodeUpdateEmail.as_view(),name='sendcode_updateemail'),

    #我的课程
    url('^mycourse/$',MyCourseView.as_view(),name='mycourse'),

    #我的收藏：默认机构
    url('^myfav/org/$',MyFavOrgView.as_view(),name='org'),

    #我的收藏：教师
    url('^myfav/teacher/$',MyFavTeacherView.as_view(),name='teacher'),

    #我的收藏：课程
    url('^myfav/course/$',MyFavCourseView.as_view(),name='course'),

    #我的消息
    url('^mymsg/$',MyMsgView.as_view(),name='mymsg'),
]