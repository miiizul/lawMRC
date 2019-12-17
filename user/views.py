from django.shortcuts import render
from django.shortcuts import HttpResponse
from django.http.response import JsonResponse
# Create your views here.

def login(request):
    print('进入接口login')
    json = {}
    if request.method == "POST":
        username = request.POST.get("username", None)
        password = request.POST.get("password", None)
        flag = request.POST.get("flag", None)

        if flag:
            json['resultCode'] = '10001'
            json['resultDesc'] = '登录成功'
            print(username, password, flag)
        else:
            json['resultCode'] = '50000'
            json['resultDesc'] = '登录失败'
            print('fail')

    return JsonResponse(json)