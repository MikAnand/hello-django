FROM python:3.7-alpine


#runs python in unbuffered mode, prints op without buffering
ENV PYTHONUNBUFFERED 1

#copies requirements file
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#creates a user only for runnig application, otherwise app will run as root user!
RUN adduser -D user
USER user