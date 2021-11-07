import re
from rest_framework_simplejwt.tokens import RefreshToken

from {{cookiecutter.project_name}}.utils import get_rand_str


def check_email(email):
    assert re.match(
        r"""(^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$)""",
        email,
    ), "This is not valid email"
    return True


def create_username(model, from_string):
    username = re.sub(r"\W+", "", from_string)
    while model.objects.filter(username=username).exists():
        username += get_rand_str(2)
    return username


def check_username(username):
    assert re.match(
        r"""^[a-z]+[a-z0-9_@.-]+$""", username
    ), "username should not contain special charecter"
    assert len(username) > 3, '"username" should greater than "3" char'
    return True


def check_password(password):
    assert len(password) > 6, '"password" should greater than or equal "6" char'
    return True


def get_token_for_user(user):
    refresh = RefreshToken.for_user(user)
    return str(refresh.access_token)


if __name__ == "__main__":
    print(check_email("nayanbis@was"))
