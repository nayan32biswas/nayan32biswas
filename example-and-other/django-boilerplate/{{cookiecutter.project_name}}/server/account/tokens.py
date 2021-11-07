import jwt
from datetime import timedelta
from django.utils import timezone
from django.conf import settings
from django.contrib.auth import get_user_model

from rest_framework_simplejwt.tokens import RefreshToken

User = get_user_model()


def get_user_from_token(jwt_token):
    if jwt_token:
        try:
            payload = jwt.decode(
                jwt_token, settings.SECRET_KEY, algorithms=(settings.JWT_ALGORITHM,)
            )
        except Exception:
            raise ValueError("Token is invalid")
        user = User.objects.get(username=payload["username"])
        return user
    raise ValueError("Invalid request")


def create_token(user, DELTA_TIME):
    payload = {
        "time": str(timezone.now()),
        "username": user.username,
        "exp": timezone.now() + DELTA_TIME,
    }
    jwt_token = jwt.encode(payload, settings.SECRET_KEY, settings.JWT_ALGORITHM)
    token = jwt_token.decode("utf-8")
    return token


def get_custom_token(user):
    token = create_token(user, timedelta(days=1))
    return token


def get_custom_invalid_token(user):
    DELTA_TIME = timedelta(seconds=1)
    payload = {
        "time": str(timezone.now()),
        "username": user.username,
        "exp": timezone.now() + DELTA_TIME,
    }
    jwt_token = jwt.encode(
        payload, "UnknownSecretKeyinvalidsecrate", settings.JWT_ALGORITHM
    )
    token = jwt_token.decode("utf-8")
    return token


def get_token_from_user(user):
    refresh = RefreshToken.for_user(user)
    return str(refresh.access_token)


def get_login_response(user):
    refresh = RefreshToken.for_user(user)
    res = {
        "username": user.username,
        "refresh": str(refresh),
        "access": str(refresh.access_token),
    }
    return res
