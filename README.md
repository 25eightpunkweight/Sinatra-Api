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
  * `docker-compose up --detach` Detached mode: Run containers in the background, print new container names. Incompatible with `--abort-on-container-exit`.
  * `docker-compose build` just builds the containers.
  * `docker-compose build --no-cache` builds the containers from scratch.
  * `docker-compose down` stops your containers.
  * when you have containers up, `docker ps` shows your currently up containers.
  * if you want to access a container's STDOUT, open a separate terminal and enter `docker attach <container name>`
  * if you want to ssh into a container, you can use `docker exec -it <container name> /bin/bash -l`


### ShiftCare - Welcome!

You are seeing README as part of a branch on a public repo that I have. Please build and start the docker containers via:
 
 `docker-compose up --build`

From there, you can bash into the container via:

`docker exec -it sinatra-api-sinatra-api-1 /bin/bash -l`

In this branch, I have the class `ClientService` in `lib/helpers/client_service.rb`. I have two methods from the points of criteria you've stated under the task description. Comments are available in the `ClientService` class for more information. Once you're inside the container, you can start a rake console of the app via:

`rake console`

and use the methods `ClientService.search_by_key()` and `ClientService.find_dups()`.

RSpec tests are also available in this branch. The tests I've written for the service object is available at `spec/lib/helpers/client_service_spec.rb`.

While still inside the container, you can run `rake test` to verify the unit tests.

> What if we wanted to offer the same functionality on a REST API? i.e. GET http://localhost:3000/query?q=foo

I've set this sinatra application as a prototype if we want to serve this functionality on a REST API. a sample endpoint for clients is available at `lib/controllers/clients_controller.rb`. If we're working with rails, this would be more robust though. Considerations such as CORS configuration or Pagination should be applied when working on production-ready applications.

> What if we wanted to offer this capability at scale?

Lots to considere here. We can implement database indexes, query and schema optimization, pagination, or even caching.