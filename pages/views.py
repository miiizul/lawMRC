from django.shortcuts import render

# Create your views here.
def loginPage(request):
    return render(request, 'login.html')

def crawlPage(request):
    return render(request, 'crawl.html')

def queryPage(request):
    return render(request, 'query.html')

def chartsPage(request):
    return render(request, 'charts.html')

def tablesPage(request):
    return render(request, 'tables.html')