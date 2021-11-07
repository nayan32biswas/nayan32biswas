#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done
    echo "PostgreSQL started"
fi

# mkdir -p app/staticfiles/{debug_log,media,static,build}
mkdir -p staticfiles/debug_log staticfiles/media staticfiles/static
python manage.py migrate
python manage.py collectstatic --no-input

exec "$@"