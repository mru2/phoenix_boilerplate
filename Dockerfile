FROM elixir:1.3.3

ENV RELX_REPLACE_OS_VARS true

RUN mkdir /app
WORKDIR /app

COPY rel .

ENTRYPOINT ["./releases/bin/api"]
CMD ["foreground"]
