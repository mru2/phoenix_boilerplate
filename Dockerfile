FROM elixir:1.3.3

# Compile app
ADD . /app
WORKDIR /app

# Install Elixir Deps
ADD mix.* ./
RUN mix local.hex --force
RUN mix deps.get

# Install app
RUN mix compile

# Exposes this port from the docker container to the host machine
EXPOSE 4000

# The command to run when this image starts up
CMD mix ecto.migrate && mix phoenix.server

