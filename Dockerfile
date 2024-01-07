


FROM python:3
WORKDIR /django
COPY . /django

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install djongo
RUN python -m pip install "pymongo[srv]"

# The following lines are moved to CMD
# RUN python /django/manage.py makemigrations
# RUN python manage.py migrate

COPY . .

CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000

