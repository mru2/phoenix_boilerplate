FROM elixir:1.3.3

ENV VERSION 0.0.1

RUN mkdir /app
WORKDIR /app
COPY ./rel/api/releases/$VERSION/api.tar.gz /app/api.tar.gz
RUN tar -zxvf api.tar.gz

WORKDIR /app/releases/$VERSION
ENTRYPOINT ["./api.sh"]
CMD ["foreground"]
