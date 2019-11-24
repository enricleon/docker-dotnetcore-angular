FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster

LABEL maintainer="info@enricleon.com" \
org.label-schema.vcs-url="https://github.com/enricleon/docker-dotnetcore-angular"

# Setup NodeJs
RUN apt-get update -y
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash --debug
Run apt-get install nodejs python make g++ -yq \
&& npm install -g npm \
&& npm install -g node-sass --force --unsafe-perm=true --allow-root \
&& npm install -g @angular/cli 
# End setup
