# Extend from the official Elixir image.
FROM elixir:latest

RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

# Create app directory and copy the Elixir projects into it.
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install Hex package manager.
# By using `--force`, we don’t need to type “Y” to confirm the installation.
RUN mix local.hex --force

# Install required dependencies
RUN mix local.rebar --force

# Compile the project.
RUN mix do compile

EXPOSE 4001

CMD ["/app/entrypoint.sh"]
