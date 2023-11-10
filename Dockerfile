FROM python:latest
WORKDIR .
RUN apt-get update -y
RUN apt install -y python3-pip
COPY requirements.txt requirements.txt
ADD . ./
RUN pip3 install --no-cache-dir -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
EXPOSE 80
CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]
