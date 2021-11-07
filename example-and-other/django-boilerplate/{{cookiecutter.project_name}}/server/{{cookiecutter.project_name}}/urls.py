from django.contrib import admin
from django.urls import path, include, re_path
from django.conf.urls.static import static
from django.contrib.auth import settings
from django.views.generic import TemplateView
from rest_framework.routers import DefaultRouter

{% if cookiecutter.add_account == "yes" %}
from account import views as ac_views
{% endif %}

router = DefaultRouter()

{% if cookiecutter.add_account == "yes" %}
router.register(r"auth/user", ac_views.UserViewSet)
{% endif %}

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include(router.urls)),
    {% if cookiecutter.add_account == "yes" %}
    path("api/auth/forgot-password/", ac_views.ForgotPasswordAPIView.as_view()),
    path("api/auth/after-login/", ac_views.after_login),
    {% endif %}
]

if settings.DEBUG:
    urlpatterns = urlpatterns + static(
        settings.STATIC_URL, document_root=settings.STATIC_ROOT
    )
    urlpatterns = urlpatterns + static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT
    )
    import debug_toolbar

    urlpatterns += [
        path("__debug__/", include(debug_toolbar.urls)),
    ]

urlpatterns += [
    path("", TemplateView.as_view(template_name="index.html")),
    re_path(r"^.*/$", TemplateView.as_view(template_name="index.html")),
]  # this line for reactjs
