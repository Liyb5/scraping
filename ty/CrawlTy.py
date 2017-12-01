#天涯煮酒-古代的医生
import requests
from lxml.html import etree

#下载器
class Downloader(object):

    def __init__(self):
        self.headers = {
        'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding':'gzip, deflate, sdch',
        'Accept-Language':'zh-CN,zh;q=0.8',
        'Connection':'keep-alive',
        'Host':'bbs.tianya.cn',
        'Referer':'http://bbs.tianya.cn/post-no05-120045-1.shtml',
        'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4033.400 QQBrowser/9.6.12624.400'
        }

    def download(self,url):
        self.s = requests.session()
        #div元素中的文本前有<br>，<b><font color=#gg0000>两种css属性，导致文本不能显示，故在此将其替换掉
        self.r = self.s.get(url,headers=self.headers).text.replace('<br>', '\n')
        self.r = self.r.replace('<b><font color=#gg0000>','')
        return self.r

#文本解析器
class Paser(object):
    def paser_text(self,t):
        e = etree.HTML(t)
        # 只爬取楼主内容，使用xpath定位，最后返回element对象
        tx = e.xpath('//div[@_hostid=16583572]//div[@class="bbs-content" or @class="bbs-content clearfix"]')
        return tx

class Manager(Downloader,Paser):
    pass

if __name__ == '__main__':
    m = Manager()
    #页数，URL可批量生成
    for i in range(1,154):
        URL = 'http://bbs.tianya.cn/post-no05-120045-%d.shtml'% i
        print(URL)
        d = m.download(URL)
        p = m.paser_text(d)
        for item in p:
            with open('ty.txt','a+',encoding='utf-8') as f:
                f.write(item.text.strip())