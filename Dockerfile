FROM ruby:3.0.2-alpine3.14

RUN apk update && apk add nodejs build-base bash libxml2-dev libxslt-dev postgresql postgresql-dev tini

SHELL ["/bin/bash", "-o", "pipefail", "-o", "errexit", "-u", "-c"]

WORKDIR /usr/local/app

USER root

ENTRYPOINT [ "tini", "--", "/usr/local/app/scripts/entrypoint.sh" ]