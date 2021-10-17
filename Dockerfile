FROM python:3.9.7-alpine3.14

# RUN set -x && apk add --no-cache bash

RUN set -x && apk add --no-cache bash git vim && \
  mkdir -p ~/git && \
  cd ~/git/ && \
  git clone https://github.com/teityura/dotfiles.git && \
  cd dotfiles/ && \
  ./copy-dotfiles.sh

WORKDIR /usr/src/codes
COPY ./codes/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
