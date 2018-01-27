"""BlueSky URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import xadmin

from django.conf.urls import url,include
from django.views.generic import TemplateView

from users.views import *
from organization.views import *

from django.views.static import serve
from BlueSky.settings import MEDIA_ROOT

urlpatterns = [
    #后台管理系统
    url(r'^admin/', xadmin.site.urls),
    #用户路由系统
    url(r'^$',IndexView.as_view(),name='index'),
    url(r'^login/$',LoginView.as_view(),name='login'),
    url(r'^logout/$',LogoutView.as_view(),name='logout'),
    url(r'^register/$',RegisterView.as_view(),name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^active/(?P<active_code>\w+)/$',ActiveView.as_view(),name='active'),
    url(r'^forget/$',ForgetPwdView.as_view(),name='forget_pwd'),
    url(r'^reset/(?P<active_code>\w+)/$',ResetView.as_view()),
    url(r'^media(?P<path>.*)/$',serve,{'document_root':MEDIA_ROOT}),

    #debug为False自己处理static访问函数
    # url(r'^static(?P<path>.*)/$',serve,{'document_root':STATIC_ROOT}),

    #机构
    url(r'^org/',include('organization.urls',namespace='org')),

    #课程
    url(r'^course/',include('courses.urls',namespace='course')),

    #用户
    url(r'^user/',include('users.urls',namespace='user')),

    #富文本相关url
    url(r'^ueditor/',include('DjangoUeditor.urls' )),
]

#全局404页面配置，当出现404自动调用该函数
handler404 = 'users.views.page_not_found_404'   #同时要配置DEBUG为False，ALLOWED_HOSTS

handler500 = 'users.views.page_error_500'