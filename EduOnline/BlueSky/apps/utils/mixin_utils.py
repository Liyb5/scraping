from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

class LoginRequiredMixin(object):
    '''
    用户点击开始学习前须登录，否则重定向到登录页.
    在views要继承
    '''
    @method_decorator(login_required(login_url = '/login/'))
    def dispatch(self,request,*args,**kwargs):
        return super(LoginRequiredMixin,self).dispatch(request,*args,**kwargs)