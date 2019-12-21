import re

from django.shortcuts import render
from django.shortcuts import HttpResponse
from django.http.response import JsonResponse
from user import models


# Create your views here.

def login(request):
    print('进入接口login')
    json = {}
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        if username.strip() == '' or password.strip() == '':
            json['resultCode'] = '20000'
            json['resultDesc'] = '参数不全'
        else:
            phoneFlag = True
            emailFlag = True
            try:
                user = models.User.objects.get(u_phone=username)
            except:
                phoneFlag = False

            if phoneFlag:
                if user.u_password == password:
                    json['resultCode'] = '10001'
                    json['resultDesc'] = '登陆成功'
                    request.session['u_id'] = user.u_id
                else:
                    json['resultCode'] = '10003'
                    json['resultDesc'] = '密码错误'
            else:
                try:
                    user = models.User.objects.get(u_email=username)
                except:
                    emailFlag = False

                if emailFlag:
                    print("邮箱存在")
                    if user.u_password == password:
                        json['resultCode'] = '10001'
                        json['resultDesc'] = '登陆成功'
                        request.session['u_id'] = user.u_id
                    else:
                        json['resultCode'] = '10003'
                        json['resultDesc'] = '密码错误'
                else:
                    json['resultCode'] = '10002'
                    json['resultDesc'] = '用户不存在'

    return JsonResponse(json)



def crawl(request):
    print('进入接口crawl')
    json = {}
    if request.method == "POST":
        keyword = request.POST.get("keyword")
        pageNum = request.POST.get("pageNum")

        # 存储到数据库
        print(keyword, pageNum)
        # models.Keyword.objects.create(keyword=keyword)

        from selenium import webdriver
        from selenium.webdriver.chrome.options import Options
        import time
        import hashlib

        # #正常模式
        # chrome_options = webdriver.ChromeOptions()
        # chrome_options.add_argument('--start-maximized')
        # #无头模式启动
        # chrome_options.add_argument('--headless')
        # #谷歌文档提到需要加上这个属性来规避bug
        # chrome_options.add_argument('--disable-gpu')
        # plugin_file = './spider/utils/proxy_auth_plugin.zip'
        # chrome_options.add_extension(plugin_file)

        # firefox-headless
        # from selenium import webdriver
        # options = webdriver.FirefoxOptions()
        # options.set_headless()
        # # options.add_argument('-headless')
        # options.add_argument('--disable-gpu')
        # driver = webdriver.Firefox(firefox_options=options)
        # driver.get('http://httpbin.org/user-agent')
        # driver.get_screenshot_as_file('test.png')
        # driver.close()

        # chrome-headless
        chrome_options = Options()
        # 无头模式启动
      #  chrome_options.add_argument('--headless')
        # 谷歌文档提到需要加上这个属性来规避bug
        chrome_options.add_argument('--disable-gpu')
        chrome_options.add_argument('--start-maximized')
        # 初始化实例
        driver = webdriver.Chrome(options=chrome_options)
        #    self.browser = webdriver.Chrome(chrome_options=self.chrome_options)
        # wait = WebDriverWait(driver, TIMEOUT)
        url = "https://www.itslaw.com/search?searchMode=judgements&sortType=1&conditions=searchWord%2B%E6%B3%95%E5%BE%8B%2B1%2B%E6%B3%95%E5%BE%8B&searchView=text"
        driver.get(url)
        # 点击登录
        o=0
        p=0
        while 1:
            try:
                driver.find_element_by_class_name("login-btn").click()
                print("输入密码ing")
                time.sleep(2)
                driver.find_element_by_xpath("//input[@id='username']").click()
                driver.find_element_by_xpath("//input[@id='username']").clear()
                driver.find_element_by_xpath("//input[@id='username']").send_keys('13667272850')
                driver.find_element_by_xpath("//input[@id='password']").click()
                driver.find_element_by_xpath("//input[@id='password']").clear()
                driver.find_element_by_xpath("//input[@id='password']").send_keys('mssjwow123')
                driver.find_element_by_class_name("submit").click()
                time.sleep(2)

                driver.find_element_by_xpath("//input[@placeholder='输入“?”定位到当事人、律师、法官、法院、标题、法院观点']").click()
                print("搜索关键词ing")
                driver.find_element_by_xpath("//input[@placeholder='输入“?”定位到当事人、律师、法官、法院、标题、法院观点']").clear()
                driver.find_element_by_xpath("//input[@placeholder='输入“?”定位到当事人、律师、法官、法院、标题、法院观点']").send_keys(keyword)
                driver.find_element_by_class_name("search-box-btn").click()
                time.sleep(3)

                # 加载更多
                # j = 1
                # for j in range(4):
                #     element = driver.find_element_by_xpath("//button[@class='view-more ng-scope']")
                #     element.click()
                #     time.sleep(3)

                lis = driver.find_elements_by_xpath('//div[@class = "judgements"]/div[@class="judgement ng-scope"]')

                for i in range(len(lis)):
                    print("开始点击")
                    i = i + 1
                    print("在这里")
                    div_str = '//div[@class="judgements"]/div[{}]/div[2]/h3/a'.format(i)
                    #title
                    title = driver.find_element_by_xpath(div_str).text
                    hl = hashlib.md5()
                    hl.update(title.encode(encoding='utf-8'))
                    #md5
                    title_md5=hl.hexdigest()
                    div_str = '//div[@class="judgements"]/div[{}]/div[2]/h3/a'.format(i)
                    driver.find_element_by_xpath(div_str).click()
                    print("点击完成")
                    all_h = driver.window_handles
                    driver.switch_to.window(all_h[1])
                    h2 = driver.current_window_handle
                    print('已定位到元素')
                    time.sleep(3)
                    try:
                        wenshu = driver.find_element_by_xpath('//section[@class="paragraphs ng-isolate-scope"]').text
                        f = open('./data/' + title_md5 + '.txt', 'a')
                        f.write(wenshu)
                        f.write('\n')
                        f.close()
                        print("成功")
                        o=o+1
                    except:
                        print("失败")
                        p=p+1
                    driver.close()
                    driver.switch_to.window(all_h[0])

                driver.close()
                result = "ok"
                json['resultCode'] = '10001'
                json['resultDesc'] = '爬取成功'
                print(o)
                print(p)
                print('关闭')
                # end = time.process_time()
                break
            except:
                print("还未定位到元素!")

    return JsonResponse(json)



def readcomprehend(request):
    print('进入接口readcomprehend')
    json = {}

    if request.method == "POST":
        questions = request.POST.get("questions")
        print(questions)

    json['resultCode'] = '10001'
    json['resultDesc'] = '操作成功'
    json['data'] = questions

    return JsonResponse(json)


def dataAnalysis(request):
    print('进入接口classAnalysis')
    json = {}
    if request.method == "POST":
        questions = request.POST.get('questions')
        keyword = request.POST.get('keyword')

        questionList = questions.split(';')

        if len(questionList) > 0 and keyword.strip() != '':
            try:
                k_id = models.Keyword.objects.get(k_keyword=keyword)

                for question in questionList:
                    try:
                        q_id = models.Question.objects.get(q_name=question, k_id=k_id)
                        try:
                            answers = models.Answer.objects.filter(q_id=q_id, k_id=k_id).values_list('a_answer')
                            answer_classes = list(set(answers))
                            if len(answer_classes) > 10:
                                answer_freq = {ans: answers.count(ans) for ans in answer_classes[:10]}
                            else:
                                answer_freq = {ans: answers.count(ans) for ans in answer_classes}

                            json['resultCode'] = '10001'
                            json['resultDesc'] = '分析成功'
                            json['data'] = answer_freq
                        except:
                            json['resultCode'] = '30000'
                            json['resultDesc'] = '服务器故障'
                    except:
                        json['resultCode'] = '30000'
                        json['resultDesc'] = '服务器故障'
            except:
                json['resultCode'] = '30000'
                json['resultDesc'] = '服务器故障'
        else:
            json['resultCode'] = '30000'
            json['resultDesc'] = '服务器故障'

    return JsonResponse(json)

def regressionAnalysis(request):
    print('进入接口regressionAnalysis')
    json = {}

    return JsonResponse(json)

def clusterAnalysis(request):
    print('进入接口clusterAnalysis')
    json = {}

    return JsonResponse(json)

# def read(request):
#     question = request.POST.get("question")
#     if question:
#         UserModel.objects.create()  # 增
#         UserModel.objects.get()  # 查（只查看一条数据）
#         UserModel.objects.filter()  # 查看多条数据
#         UserModel.objects.filter().update()  # 改
#         UserModel.objects.filter().delete()  # 删
#         QsModel.objects.create(
#             question = question,)
#         result = "OK"
#     else:
#         result = "Not OK"
#     print(question)
#     return render(request, "login/read.html", locals())