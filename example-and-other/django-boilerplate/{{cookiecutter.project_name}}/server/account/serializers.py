from django.contrib.auth import get_user_model

from rest_framework import serializers

from . import utils as ac_utils

# from .emails import send_activation_email

User = get_user_model()


class RegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(label="Password", write_only=True)
    confirm_password = serializers.CharField(label="Confirm Password", write_only=True)

    class Meta:
        model = User
        fields = (
            "email",
            "username",
            "first_name",
            "last_name",
            "password",
            "confirm_password",
        )
        extra_kwargs = {
            "username": {"read_only": True},
        }

    def validate_email(self, email):
        if not ac_utils.check_email(email):
            raise serializers.ValidationError("Email is not valid")
        user_exists = User.objects.filter(email=email).exists()
        if user_exists:
            raise serializers.ValidationError("This user has already registered.")
        ac_utils.check_email(email)
        return email

    def validate_confirm_password(self, confirm_password):
        password = self.get_initial().get("password")
        if password != confirm_password:
            raise serializers.ValidationError("Passwords must match.")
        if not ac_utils.check_password(password):
            raise serializers.ValidationError("Password is too short")
        ac_utils.check_password(password)
        return confirm_password

    def create(self, validated_data):
        validated_data.pop("confirm_password")
        user = User.objects.create(**validated_data)
        # send_activation_email(user)
        return user


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            "email",
            "username",
            "first_name",
            "last_name",
            "profile_avatar",
            "date_joined",
            "role",
            "profile_image",
            "gender",
        )
        extra_kwargs = {
            "role": {"read_only": True},
            "profile_avatar": {"read_only": True},
            "date_joined": {"read_only": True},
        }
