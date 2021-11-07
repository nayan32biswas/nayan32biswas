from rest_framework.permissions import BasePermission, SAFE_METHODS


class IsOwnerOrReadOnly(BasePermission):
    message = "You must be the owner of this object."

    def has_object_permission(self, request, view, obj):
        if request.method in SAFE_METHODS:
            return True
        return obj.user == request.user


class IsOwner(BasePermission):
    message = "You must be the owner of this object."

    def has_object_permission(self, request, view, obj):
        return obj.user == request.user


class IsAdministrator(BasePermission):
    def has_permission(self, request, view):
        return request.user.role >= 7

    def has_object_permission(self, request, view, obj):
        return request.user.role >= 7
