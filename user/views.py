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