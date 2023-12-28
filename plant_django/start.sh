#!/bin/bash

# 進程執行celery
# celery multi start w1 -A celery_tasks worker -l info &&
python manage.py collectstatic --noinput &&
python manage.py makemigrations &&
python manage.py showmigrations &&
python manage.py migrate &&
python manage.py migrate cart_api --database=cart_db &&
python manage.py set_default_user --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL --password $DJANGO_SUPERUSER_PASSWORD &&
gunicorn main_setting.wsgi:application -c gunicorn.conf # (folder where wsgi.py in).wsgi:
