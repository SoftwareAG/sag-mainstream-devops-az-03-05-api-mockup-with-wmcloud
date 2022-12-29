# Development run configuration 01

This run configuration is provided for the development of the related code, in this repository as well as the dependency packages repositories.

## Prerequisites

- docker compose to spin up the development server
- Software AG Designer to author flow services
- `*.env` editor (e.g. Visual Studio Code with DOTENV extension)
- valid Software AG Microservices Runtime license file
- a git client
- a Software AG webmethods.io integration tenant, having flow services enabled
- access to a microservices runtime image, the example considers the 10.15 version from https://containers.softwareag.com

## Usage

- clone the dependency repositories into local folders
  - [WxSimpleConfig](https://github.com/SoftwareAG/WxSimpleConfig/)
  - [SagServiceMockup](https://github.com/SoftwareAG/sag-mainstream-devops-az-03-03-api-mockup)
- copy `example.env` into `.env`
- edit `.env` and provide the required local information
- spin up the server with `docker-compose up`
- open designer and connect to `http://localhost:${HOST_PORT_PREFIX}55`
