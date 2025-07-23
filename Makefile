run:
	@python3 manage.py runserver

makemigrations :
	@python3 manage.py makemigrations 

migrate:
	@python3 manage.py migrate

superuser:
	@python3 manage.py createsuperuser

version:
	@django-admin --version

reset-migrations:
	@bash scripts/reset_migrations.sh
