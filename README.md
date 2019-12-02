# Build container for dotnet Angular projects
[enricleon/dotnetcore-angular](https://hub.docker.com/r/enricleon/dotnetcore-angular) is a docker image to build dotnet core based Angular projects. 

This image is based on *dotnet/core/sdk:3.0* and contains everything you need to build a dotnet core based Angular project:
* Node.js (latest)
* NPM (latest)
* node-sass (latest)
* Angular CLI (latest)

The image will reduce your build time to a minimum since you don't have to run ```npm rebuild node-sass``` for every build.

# Usage

Consider you created a project using ```dotnet new angular -o MyAngular```, all you need to containerize your project is the following Dockerfile:

```bash
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM enricleon/dotnetcore-angular:latest AS build
WORKDIR /src
COPY ["MyAngular.csproj", "./"]
RUN dotnet restore "./MyAngular.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "MyAngular.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyAngular.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyAngular.dll"]
```
