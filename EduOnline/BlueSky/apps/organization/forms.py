from django import forms
from operation.models import UserAsk
import re

class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        mobile = self.cleaned_data.get('mobile','')
        re_mobile = re.compile('^1[358]\d{9}$|^147\d{8}$|^176\d{8}$')
        if re_mobile.match(mobile):
            return mobile
        else:
            raise forms.ValidationError('手机号非法',code='mobile_invalid')