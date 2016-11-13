FROM elixir:1.3.3

ENV VERSION 0.0.1
ENV MIX_ENV prod

# Do we have to...
RUN mkdir /src
WORKDIR /src
ADD . /src

# Fetch dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix hex.info

# Build the release
RUN mix compile
RUN mix release

RUN mkdir /app
WORKDIR /app
RUN cp /src/rel/api/releases/$VERSION/api.tar.gz /app/api.tar.gz
RUN tar -zxvf api.tar.gz

WORKDIR /app/releases/$VERSION
ENTRYPOINT ["./api.sh"]
CMD ["foreground"]
