FROM ubuntu:latest
MAINTAINER James Swineson <docker@public.swineson.me>

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y python-virtualenv\
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

RUN git clone https://github.com/noise/snapstore.git \
    && cd snapstore \
    && virtualenv env \
    && . env/bin/activate \
    && pip install -r requirements.txt

VOLUME /var/www/snapstore/files
EXPOSE 3000
CMD ["python", "store.py"]
