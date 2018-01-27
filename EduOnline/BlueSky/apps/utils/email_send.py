from users.models import EmailVerifyRecord
from random import choice
from django.core.mail import send_mail
from BlueSky.settings import EMAIL_FROM

def random_str(randomlength=10):
    s = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'
    for i in range(randomlength):
        s += choice(chars)
    return s

def send_register_email(email,send_type='register'):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()
    email_title = ''
    email_body = ""

    if send_type == 'register':
        email_title = 'LYB在线网激活链接'
        email_body = '请点击以下链接完成帐号激活:\nhttp://127.0.0.1:8000/active/{}'.format(code)

        send_status = send_mail(email_title,email_body,EMAIL_FROM,[email])
        if send_status:
            pass

    elif send_type == 'forget':
        email_title = 'LYB在线网密码重置链接'
        email_body = '请点击以下链接重置密码:\nhttp://127.0.0.1:8000/reset/{}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == 'update_email':
        email_title = 'LYB在线邮箱重置激活码'
        email_body = '您的邮箱验证码是:\n{}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass