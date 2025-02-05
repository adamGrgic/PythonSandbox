from django.shortcuts import render
from .models import Item  # Ensure your models are imported if needed


def home(request):
    items = Item.objects.all()
    return render(request, 'myapp/home.html', {'items': items})


# Create your views here.
