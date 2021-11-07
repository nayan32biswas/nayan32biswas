from .base import *

DEBUG = False

ALLOWED_HOSTS = ["127.0.0.1", "localhost"]

{% if cookiecutter.django_rest_framework == "yes" %}
REST_FRAMEWORK["DEFAULT_RENDERER_CLASSES"] = ["rest_framework.renderers.JSONRenderer"]
{% endif %}

"""Uncommit this if site become https"""
# # Start https only block
# CORS_REPLACE_HTTPS_REFERER = True,
# HOST_SCHEME = "https://",
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https'),
# SECURE_SSL_REDIRECT = True,
# SESSION_COOKIE_SECURE = True,
# CSRF_COOKIE_SECURE = True,
# # "CSRF_COOKIE_HTTPONLY": True, # If this field is active JS never get csrf token
# SECURE_HSTS_INCLUDE_SUBDOMAINS = True,
# SECURE_HSTS_SECONDS = 1000000,
# SECURE_FRAME_DENY = True,
# # End block
