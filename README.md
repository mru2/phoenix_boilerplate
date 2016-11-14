[![Build Status](https://travis-ci.org/mru2/phoenix_boilerplate.svg?branch=master)](https://travis-ci.org/mru2/phoenix_boilerplate)

# Phoenix Boilerplate

Default setup for developing, testing, and deploying a phoenix app

# Test

```
mix test
```

# Dev

## Dependencies

* elixir
* docker

## Setup

```
mix deps.get
```

## Use

Run a local server with :

```
docker-compose up
env $(cat .env | xargs) mix phoenix.server
```

Run a console with :

```
docker-compose up
env $(cat .env | xargs) iex -S mix phoenix.server
```


# Deploy

## Dependencies

* travis
* docker-cloud

## Setup

### Travis

Add your docker-cloud credentials in environment variables

```
DOCKER_USERNAME myusername
DOCKER_PASSWORD secretsecret
```

### Docker Cloud

Configure a stack using the `docker-cloud.yml` stackfile
