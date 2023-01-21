# Pair Todo - Backend

This project is as backend application of a simple todo list. In order to work properly, this application needs a frontend app. [Here](https://github.com/lionffl/pair-todo-frontend) you can find a repository with a React App ready to work as frontend.

## Prerequisites

* Ruby 3.2.0
* Rails 7.0.4
* Postgres
* Docker
* Docker-compose

## Installation and basic usage

* Clone repository: `git clone git@github.com:lionffl/pair-todo-backend.git`
* Navigate to project folder: `cd pair-todo-backend`
* Install the required dependencies: `bundle install`
* Set up environment variables by renaming `config/envs.rb.example` to `envs.rb`
* Run postgresql container: `docker-compose up`
* Set up the database: `rails db:create`, `rails db:migrate`
* Start the server: `rails server`

The server should now be running at http://localhost:3000.

## Postman Collection

You can import the file `Pair-todo.postman_collection.json` on your Postman client and use as request reference.

## Contact

* lionffl@gmail.com / felipelima@geografialinks.com
