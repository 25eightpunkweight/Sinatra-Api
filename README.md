# Sinatra MC API Boilerplate

Forked from [Wixel's Frank-Sinatra boilerplate](https://github.com/Wixel/Frank-Sinatra) with bunch of adjustments to make it work as a barebones model & controller API that's meant to be paired with a different frontend app of your choice. (Frontend app not included)

You should read Wixel's README from the source repo first before continuing with this repo's README to give you more context.

## Installation - Requirements

Aside from Wixel's original requirements of [Ruby](http://www.ruby-lang.org/), [Rubygems](http://rubygems.org/), [Git](http://git-scm.com/), and [Bundler](http://rubygems.org/gems/bundler), you will need:
  * [PostgreSQL 14.4 or newer](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart) (instead of SQLite3 from the original)




### Installation - Docker

Alternatively, this repo comes with a Dockerfile and a docker-compose.yml. You will need:
  * [Docker 20.10.17 or newer](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
  * [docker-compose 1.27.4 or newer](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

This dockerfile uses a latest image of ruby, and a separate container for the postgresql db. Here are some commands to get you started:

  * `docker-compose up` starts the sinatra-api and postgres containers (and any other containers you have specified in your `docker-compose.yml` file)
  * `docker-compose up --build` rebuilds the containers first before starting it.
  * `docker-compose build` just builds the containers.
  * `docker-compose build --no-cache` builds the containers from scratch.
  * `docker-compose down` stops your containers.
  * when you have containers up, `docker ps` shows your currently up containers.
  * if you want to access a container's STDOUT, open a separate terminal and enter `docker attach <container name>`
  * if you want to ssh into a container, you can use `docker exec -it <container name> /bin/bash -l`