import logging
import os
import sys
import random
import string
import secrets


from django.utils import timezone
from django.utils.text import slugify

from pathlib import Path
from PIL import Image

# from celery import shared_task


logging.basicConfig(
    filename=f"staticfiles/debug_log/{timezone.now().date()}.log",
    level=logging.DEBUG,
    format="%(asctime)s:%(levelname)s:%(message)s",
)


def get_error_message_with_path(error):
    exc_tb = sys.exc_info()[2]
    error = f"{os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]}, {exc_tb.tb_lineno}, {error}"
    return error


def print_error_info(error):
    error = get_error_message_with_path(error)
    logging.warning(error)


def print_error(error):
    error = get_error_message_with_path(error)
    logging.warning(error)


def print_debug(*args):
    logging.debug(str(args))


def upload_location(instance, filename):
    def get_extension(filename):
        name_list = filename.split(".")
        return name_list[-1] if len(name_list) > 1 else ""

    app_name = instance.__class__.__name__
    extension = get_extension(filename)
    app_name = app_name.lower().encode("utf-8").hex()
    now = timezone.now().strftime("%Y%m%d%H%M%S%f")
    # year_month__app_hex_name/hour_minute_all.type
    dist = f"{now[:6]+app_name}/{now[6:]}.{extension}"
    return dist


def get_rand_str(N=None):
    N = random.randint(2, 3) if N is None else N
    return secrets.token_hex(N)


def get_mixed_key(N=10):
    return "".join(
        random.SystemRandom().choice(
            string.digits + string.ascii_uppercase + string.ascii_lowercase
        )
        for _ in range(N)
    )


def serizliser_error_message(serializer):
    error_message = serializer.error_messages
    message = ""
    if error_message.get("required") or error_message.get("null"):
        message += "Some field is missing"
    if error_message.get("invalid"):
        if len(message):
            message += " and your data is not vaild"
        else:
            message += "Your data is not vaild"
    return message


SQUARE = "SQUARE"
THUMBNAIL = "THUMBNAIL"


def get_size_KB(file_path):
    size = Path(file_path).stat().st_size
    return size / 1000


# @shared_task
def task_convert_image(file_name, size=(1500, 1500), CON_TYPE=THUMBNAIL):
    try:
        file_path = str(file_name.file)
        image = Image.open(file_path)

        if CON_TYPE == THUMBNAIL:
            image.thumbnail(size, Image.ANTIALIAS)
            image.save(file_path, quality=75)
        elif CON_TYPE == SQUARE:  # Showing error
            image.resize(size, Image.ANTIALIAS)
            image.save(file_path, quality=75)

    except Exception as error:
        print_debug(str(error))


def convert_profile(profile_image=None, profile_avatar=None):
    # task_convert_image.delay(profile_image, size=(1200, 1200), CON_TYPE=THUMBNAIL)
    # task_convert_image.delay(profile_avatar, size=(100, 100), CON_TYPE=THUMBNAIL)

    task_convert_image(profile_image, size=(1200, 1200), CON_TYPE=THUMBNAIL)
    task_convert_image(profile_avatar, size=(100, 100), CON_TYPE=THUMBNAIL)
