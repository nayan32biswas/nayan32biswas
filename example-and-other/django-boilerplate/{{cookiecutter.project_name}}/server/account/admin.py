from django.contrib import admin
from django.contrib.admin.models import LogEntry
from django.contrib.auth.models import Group
from django.utils.translation import ugettext as _
from account import models


@admin.register(LogEntry)
class LogEntryAdmin(admin.ModelAdmin):
    date_hierarchy = "action_time"
    list_filter = ["user", "content_type", "action_flag"]
    search_fields = ["object_repr", "change_message"]
    list_display = [
        "action_time",
        "user",
        "content_type",
        "action_flag",
    ]


@admin.register(models.User)
class CustomUserAdmin(admin.ModelAdmin):
    date_hierarchy = "date_joined"
    list_display = ["email", "username", "full_name"]
    list_filter = ["role"]
    fieldsets = (
        (None, {"fields": ("email", "username")}),
        (
            _("Auth Info"),
            {"fields": ("role", "is_superuser", "is_staff", "is_active")},
        ),
        (
            _("Personal info"),
            {"fields": ("first_name", "last_name")},
        ),
    )


admin.site.unregister(Group)
