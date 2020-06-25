# baziramo na ovom image-u, to je bazni image
FROM python:3.7-alpine
MAINTAINER Dusan Trtica

# Unbuffered mode za doker - recommended, izbegava probleme oko kesiranja (?)
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# kreiramo folder,
# setujemo da bude default i kopiramo sve u njega
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# kreramo usera, -D znaci da ce samo da pokrece aplikaciju
# prebacujemo na user-a koji ce da pokrece sve
# to je zbog security-ja. Ako to ne uradimo, onda kad pokrenemo image
# image ce biti pokrenut kao root
RUN adduser -D user
USER user
