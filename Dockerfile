FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster

LABEL maintainer="info@enricleon.com" \
org.label-schema.vcs-url="https://github.com/enricleon/docker-dotnetcore-angular"

RUN apk update && apk add --update --no-cache nodejs-current nodejs-npm python make g++ \
&& npm install -g npm \
&& npm install -g node-sass --force --unsafe-perm=true --allow-root \
&& npm install -g @angular/cli
