from .models import *
from xadmin import views
import xadmin

class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = 'LYB后台管理系统'
    site_footer = '自学在线'
    menu_style = 'accordion'

class EmailVerifyRecordAdmin(object):
    list_display = ['email','code','send_type','send_time']
    search_fields = ['email','code','send_type']
    list_filter = ['email','code','send_type','send_time']
    model_icon = 'fa fa-envelope-open'

class BannerAdmin(object):
    list_display = ['title', 'image', 'url','index', 'add_time']
    search_fields = ['title', 'image', 'url','index']
    list_filter = ['title', 'image', 'url','index', 'add_time']

xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(Banner,BannerAdmin)

xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSettings)