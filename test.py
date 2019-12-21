from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

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
            driver.find_element_by_xpath("//input[@placeholder='输入“?”定位到当事人、律师、法官、法院、标题、法院观点']").send_keys("北京")
            driver.find_element_by_class_name("search-box-btn").click()
            time.sleep(5)

            #加载更多
            #j = 1
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
                title=driver.find_element_by_xpath(div_str).text
           #     f = open('./data/title.txt', 'a')
                f = open('./data/'+title+'.txt', 'a')
                f.write(title)
                f.write('\n')
                f.close()
                driver.find_element_by_xpath(div_str).click()
                print("点击完成")
                all_h = driver.window_handles
                driver.switch_to.window(all_h[1])
                h2 = driver.current_window_handle
                time.sleep(3)
                print('已定位到元素')
                try:
                    wenshu = driver.find_element_by_xpath('//section[@class="paragraphs ng-isolate-scope"]').text
                    wenshu1 = wenshu[0:1000]
                    wenshu2 = wenshu[1000:2000]
                    wenshu3 = wenshu[2000:3000]
                    wenshu4 = wenshu[4000:5000]
                    wenshu5 = wenshu[5000:6000]
                    wenshu6 = wenshu[6000:7000]
                    wenshu7 = wenshu[7000:8000]
                    wenshu8 = wenshu[8000:9000]
                    wenshu9 = wenshu[9000:10000]
                    wenshu10 = wenshu[10000:11000]
                    wenshu11 = wenshu[11000:12000]
                    wenshu12 = wenshu[13000:14000]
                    wenshu13 = wenshu[14000:15000]
                    wenshu14 = wenshu[15000:16000]
                    wenshu15 = wenshu[16000:17000]
                    wenshu16 = wenshu[17000:18000]
                    wenshu17 = wenshu[18000:19000]
                    wenshu18 = wenshu[19000:20000]
                    f = open('./data/content.txt', 'a')
                    f.write(wenshu1)
                    f.write(wenshu2)
                    f.write(wenshu3)
                    f.write(wenshu4)
                    f.write(wenshu5)
                    f.write(wenshu6)
                    f.write(wenshu7)
                    f.write(wenshu8)
                    f.write(wenshu9)
                    f.write(wenshu10)
                    f.write(wenshu11)
                    f.write(wenshu12)
                    f.write(wenshu13)
                    f.write(wenshu14)
                    f.write(wenshu15)
                    f.write(wenshu16)
                    f.write(wenshu17)
                    f.write(wenshu18)
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
            print(o)
            print(p)
            print('关闭')
            # end = time.process_time()
            break
        except:
            print("还未定位到元素!")

