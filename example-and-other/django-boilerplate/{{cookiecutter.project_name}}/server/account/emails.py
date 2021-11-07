from datetime import timedelta
from django.conf import settings
from django.core.mail import EmailMessage

from account.tokens import create_token

# from django_react_template.celery import app

HOST_URL = settings.HOST_URL
EMAIL_HOST_USER = settings.EMAIL_HOST_USER


# @app.task
def send_messages(recipient_emails, subject, body="", host_email=EMAIL_HOST_USER):
    email = EmailMessage(subject, body, host_email, recipient_emails)
    email.content_subtype = "html"
    email.send()


def send_activation_email(user):
    token = create_token(user, timedelta(seconds=3600))
    REDIRECT_URI = f"{HOST_URL}/settings/confirm-verification-email/{token}"
    body = f"""
        <p>Hello {user.full_name},</p>
        <p>Verification mail.</p>
        <p>
            Link: <a href="{REDIRECT_URI}/">Verify Acount</a>
        </p>
        <br>
        <p>Thanks</p>
    """

    send_messages(
        recipient_emails=[user.email],
        subject="{{cookiecutter.project_name}}: Account Activation",
        body=body,
    )


def send_forgot_password_email(user):
    token = create_token(user, timedelta(seconds=3600))
    REDIRECT_URI = f"{HOST_URL}/auth/confirm-forgot-password/{token}"
    body = f"""
        <p>Hello {user.full_name},</p>
        <p>Verification mail.</p>
        <p>If you forgote your password</p>
        <p>
            Link: <a href="{REDIRECT_URI}/">Change password</a>
        </p>
        <br>
        <p>Thanks</p>
    """

    send_messages(
        recipient_emails=[user.email],
        subject="{{cookiecutter.project_name}}: Forgot Passsword",
        body=body,
    )
