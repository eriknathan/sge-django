#!/bin/bash

# ------------------------------------------------------------------
# Script para resetar migrações e banco de dados SQLite em um projeto Django
# ------------------------------------------------------------------

set -e

APPS=("brands" "categories" "suppliers" "products" "inflows" "outflows")
DB_FILE="db.sqlite3"

echo "🚮 Removendo pastas de migrações..."
for app in "${APPS[@]}"; do
    MIGRATIONS_DIR="$app/migrations"
    if [ -d "$MIGRATIONS_DIR" ]; then
        echo "Removendo $MIGRATIONS_DIR"
        rm -rf "$MIGRATIONS_DIR"
    fi
done

echo "⏳ Aguardando 3 segundos antes de remover o banco de dados..."
sleep 3

if [ -f "$DB_FILE" ]; then
    echo "🗑️  Removendo arquivo $DB_FILE"
    rm -f "$DB_FILE"
fi

echo "📦 Criando novas migrações..."
python3 manage.py makemigrations
python3 manage.py migrate

for app in "${APPS[@]}"; do
    echo "🔧 Criando migrações para $app"
    python3 manage.py makemigrations "$app"
done

echo "📥 Aplicando migrações..."
python3 manage.py migrate

echo "⏳ Aguardando 3 segundos antes de criar superusuário..."
sleep 3

echo "👤 Criando superusuário..."
python3 manage.py createsuperuser
