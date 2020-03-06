#!/bin/bash

FROM python:3.8
MAINTAINER Nantawat Chairat <nant.ch@gmail.com>

RUN apt update
RUN apt install -y gettext

# Add User
RUN useradd -u 1000 linux-user

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD ${pwd}/requirements.txt /usr/src/app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install ipdb

#ADD ../fonts/* /usr/share/fonts/

WORKDIR /app
