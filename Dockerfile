from python:3.7-alpine

WORKDIR /app

RUN pip install flask

COPY ./app.py /app/app.py

ENTRYPOINT [ "flask", "run"]
