import logging
from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser
from django.utils.translation import ugettext as _
from django.contrib.auth.models import PermissionsMixin

# from django.core.validators import MaxValueValidator, MinValueValidator

from {{cookiecutter.project_name}}.utils import upload_location
from .utils import check_email, check_username, create_username

logger = logging.getLogger(__name__)


class UserRoleChoices(models.IntegerChoices):
    ADMIN = 11
    BASIC = 0


class GenderChoices(models.TextChoices):
    MALE = "MALE", "Male"
    FEMALE = "FEMAL", "Female"
    OTHER = "OTHER", "Other"


class UserManager(BaseUserManager):
    def create(self, email, password=None, is_staff=False, is_active=True, **kwargs):
        email = UserManager.normalize_email(email)
        username = create_username(User, email)

        # Google OAuth2 backend send unnecessary username field
        kwargs.pop("username", None)

        user = self.model(
            email=email,
            username=username,
            is_active=is_active,
            is_staff=is_staff,
            **kwargs,
        )
        if password:
            user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password=None, **kwargs):
        return self.create(
            email,
            password,
            role=UserRoleChoices.ADMIN,
            is_staff=True,
            is_superuser=True,
            **kwargs,
        )


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        verbose_name=_("Email Address"), max_length=191, unique=True
    )
    username = models.CharField(_("Username"), max_length=191, unique=True)
    first_name = models.CharField(_("First Name"), max_length=150)
    last_name = models.CharField(_("Last Name"), max_length=150)
    is_superuser = models.BooleanField(_("Is superuser"), default=False)
    is_staff = models.BooleanField(_("Is staff"), default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(
        _("Created At"), auto_now_add=True, editable=False
    )
    """Djanog Common part end"""
    profile_avatar = models.ImageField(
        _("Profile Avatar"), upload_to=upload_location, blank=True
    )
    role = models.PositiveSmallIntegerField(
        _("Role"),
        default=UserRoleChoices.BASIC,
        choices=UserRoleChoices.choices,
    )
    profile_image = models.ImageField(
        _("Profile image"), upload_to=upload_location, blank=True
    )
    gender = models.CharField(
        _("Gender"), max_length=5, choices=GenderChoices.choices, blank=True
    )

    objects = UserManager()
    USERNAME_FIELD = "email"

    class Meta:
        indexes = [models.Index(fields=["email", "username"])]

    def __str__(self):
        return self.full_name

    _prev_email = None
    _prev_username = None

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._prev_email = self.email
        self._prev_username = self.username

    def save(self, *args, **kwargs):
        if self._prev_email and self._prev_email != self.email:
            check_email(self.email)
            assert not self.__class__.objects.filter(
                email=self.email
            ).exists(), "This Email already exists"
        if self._prev_username and self._prev_username != self.username:
            check_username(self.username)
            assert not self.__class__.objects.filter(
                username=self.username
            ).exists(), "This Username already exists"
        super().save(*args, **kwargs)

    @property
    def full_name(self):
        if self.first_name or self.last_name:
            return f"{self.first_name} {self.last_name}".strip()
        return self.username
