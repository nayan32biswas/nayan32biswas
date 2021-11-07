from .base import *

DEBUG = True


# # Start http only block
# CORS_REPLACE_HTTPS_REFERER = False,
# HOST_SCHEME = "http://",
# SECURE_PROXY_SSL_HEADER = None,
# SECURE_SSL_REDIRECT = False,
# SESSION_COOKIE_SECURE = False,
# CSRF_COOKIE_SECURE = False,
# # "CSRF_COOKIE_HTTPONLY": False, # If this field is active JS never get csrf token
# SECURE_HSTS_SECONDS = None,
# SECURE_HSTS_INCLUDE_SUBDOMAINS = False,
# SECURE_FRAME_DENY = False,
# #  End block

INSTALLED_APPS = INSTALLED_APPS + [
    # 'django.contrib.staticfiles',
    "debug_toolbar",
]

MIDDLEWARE = MIDDLEWARE + [
    "debug_toolbar.middleware.DebugToolbarMiddleware",
]

# INTERNAL_IPS = type(str('c'), (), {'__contains__': lambda *a: True})()  # is you use run by docker
{% if cookiecutter.django_rest_framework == "yes" %}
REST_FRAMEWORK["DEFAULT_RENDERER_CLASSES"] = [
    "rest_framework.renderers.JSONRenderer",
    "rest_framework.renderers.BrowsableAPIRenderer",
]
{% endif %}