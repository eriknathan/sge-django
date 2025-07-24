#!/bin/sh

echo "🟡 >> Rodando Migrate..."
python manage.py migrate --noinput

echo "🟡 >> Iniciando aplicação..."
python manage.py runserver 0.0.0.0:8000