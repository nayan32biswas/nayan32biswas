from django.db.models import Q
from django.shortcuts import get_object_or_404
from django.contrib.auth import get_user_model

from rest_framework import viewsets, decorators, views, status, mixins
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework.decorators import action

from . import (
    utils as ac_utils,
    serializers as ac_serializers,
    # permissions as ac_permission,
    # models as ac_models,
    tokens as tokens,
)
from .emails import send_activation_email, send_forgot_password_email

User = get_user_model()


class UserViewSet(
    mixins.CreateModelMixin,
    mixins.UpdateModelMixin,
    mixins.RetrieveModelMixin,
    viewsets.GenericViewSet,
):
    queryset = User.objects.all()
    permission_classes = [AllowAny]
    serializer_class = ac_serializers.RegistrationSerializer
    lookup_field = "username"

    def get_object(self, *args, **kwargs):
        return get_object_or_404(
            User, email=self.request.user.email, username=self.kwargs[self.lookup_field]
        )

    def get_queryset(self):
        return User.objects.filter(email=self.request.user.email)

    def get_serializer_class(self):
        if self.action == "create":
            return ac_serializers.RegistrationSerializer
        return ac_serializers.UserSerializer

    @action(detail=False, methods=["post"])
    def login(self, *args, **kwargs):
        """
        {
            user_identity: "email or username",
            password: "password"
        }
        """
        data = self.request.data
        try:
            user = User.objects.get(
                Q(email=data["user_identity"]) | Q(username=data["user_identity"])
            )
            # print(data, user.email, user.username)
            if user and user.check_password(data["password"]):
                res = tokens.get_login_response(user)
                return Response(res, status=status.HTTP_200_OK)
        except Exception:
            pass
        message = """Provided credintioal is not valid."""
        return Response({"message": message}, status=status.HTTP_401_UNAUTHORIZED)

    @action(detail=False, methods=["put"], permission_classes=(IsAuthenticated,))
    def password_reset(self, request, *args, **kwargs):
        """
        {
            "current_password": "current_password",
            "new_password": "new_password",
            "confirm_password": "confirm_password"
        }
        """
        user_instance = request.user
        data = request.data
        current_password = data.get("current_password")
        """Check give password is correct"""
        if not user_instance.check_password(current_password):
            return Response(status=status.HTTP_403_FORBIDDEN)
        new_password = data.get("new_password")
        confirm_password = data.get("confirm_password")
        """Check new password match with confirm password"""
        if new_password != confirm_password:
            return Response(
                {"message": "confirm password doesn't mathc with new password"},
                status=status.HTTP_406_NOT_ACCEPTABLE,
            )
        if not ac_utils.check_password(new_password):
            return Response(
                {"message": "Password is too short at list 6 charecter"},
                status=status.HTTP_406_NOT_ACCEPTABLE,
            )
        """If every thing is okay then set password"""
        user_instance.set_password(new_password)
        user_instance.save()
        return Response(
            {"message": "Password reset successfully"}, status=status.HTTP_200_OK
        )

    @action(methods=["get"], detail=False, permission_classes=(IsAuthenticated,))
    def activation_mail(self, *args, **kwargs):
        """Resend activation mail to user."""
        user = self.request.user
        if not user.email_is_verified:
            send_activation_email(user)
            context = {
                "message": "Send confirmation successfully. Please check your email"
            }
            return Response(context, status=status.HTTP_200_OK)
        context = {"message": "Your Email already verified."}
        return Response(context, status=status.HTTP_406_NOT_ACCEPTABLE)

    @action(methods=["post"], detail=False)
    def verify_email(self, *args, **kwargs):
        """
        {
            "token": "token from email"
        }
        """
        """Activate user based on token."""
        token = self.request.data.get("token")
        try:
            user = tokens.get_user_from_token(str(token))
        except Exception as error:
            return Response({"message": str(error)}, status=status.HTTP_400_BAD_REQUEST)
        user.email_is_verified = True
        user.save()
        return Response(
            {"message": "Veryfied email successfully"}, status=status.HTTP_200_OK
        )


class ForgotPasswordAPIView(views.APIView):
    def get(self, *args, **kwargs):
        """Send mail to authenticated user with token"""
        email = self.request.GET.get("email")
        user = get_object_or_404(User, email=email)
        send_forgot_password_email(user)
        context = {"message": "A email send to your mail please check it."}
        return Response(context, status=status.HTTP_200_OK)

    def post(self, *args, **kwargs):
        """Change password in forgot password"""
        data = self.request.data
        token = data.get("token")
        new_password = data.get("new_password")
        confirm_password = data.get("confirm_password")
        if new_password != confirm_password:
            return Response(
                {"message": "password does not match"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        if not ac_utils.check_password(new_password):
            return Response(
                {"message": "Your password is too short."},
                status=status.HTTP_400_BAD_REQUEST,
            )
        try:
            user = tokens.get_user_from_token(str(token))
        except Exception as error:
            return Response({"message": str(error)}, status=status.HTTP_400_BAD_REQUEST)
        if user:
            user.set_password(new_password)
            user.save()
            return Response(
                {"message": "New password set succesfully."}, status=status.HTTP_200_OK
            )
        return Response(
            {"message": "Token is not valid"}, status=status.HTTP_400_BAD_REQUEST
        )


@decorators.api_view(["GET"])
def after_login(request, *args, **kwargs):
    """Resend activation mail to user."""
    print("start_after_call")
    context = {"params": request.GET, "body": request.data}
    return Response(context, status=status.HTTP_200_OK)
