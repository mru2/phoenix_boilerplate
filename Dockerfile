FROM elixir:1.3.3

ENV RELX_REPLACE_OS_VARS true

RUN mkdir /app
WORKDIR /app

COPY rel .

ENTRYPOINT ["./releases/0.0.1/api.sh"]
CMD ["foreground"]
