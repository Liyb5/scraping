from django import forms
from captcha.fields import CaptchaField

from .models import UserProfile

import re

class LoginForm(forms.Form):
    '''
    为用户的登录设置有效形式，可减少数据库负担
    '''
    username = forms.CharField(required=True)
    password = forms.CharField(required=True,min_length=6)

class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=6)
    captcha = CaptchaField(error_messages={'invalid':'验证码错误'})

class ForgetPwdForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={'invalid':'验证码错误'})

class ResetpwdForm(forms.Form):
    password = forms.CharField(required=True, min_length=6)
    password2 = forms.CharField(required=True, min_length=6)

class ImageUploadForm(forms.ModelForm):
    '''
    用于用户图片上传
    '''
    class Meta:
        model = UserProfile
        fields = ['image']

class UserInfoForm(forms.ModelForm):
    '''
    用户个人信息中信息保存，不含邮箱，密码
    '''
    class Meta:
        model = UserProfile
        fields = ['nick_name','birthday','gender','address','mobile']
    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile','')
        re_mobile = re.compile('^1[358]\d{9}$|^147\d{8}$|^176\d{8}$')
        if re_mobile.match(mobile):
            return mobile
        else:
            raise forms.ValidationError('手机号非法',code='mobile_invalid')


