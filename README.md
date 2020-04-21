# README

This application is a practical part for the [GraphQL webinar](https://rubygarage.github.io/slides/graphql#/). It contains request specs for all queries and mutations. A part of requests has been implemented during the webinar. You should implement the rest of them.

#### Running tests
`bundle exec rspec`

#### Using IDE
You can import requests into [Insomina IDE](https://insomnia.rest/graphql/) by going into the preferences:
Application -> Preferences -> Data -> Import data.
Insomnia data file (`Insomnia_GraphQL_Meetup.json`) is located in the root directory of this app.

#### ENV variables

Create `env.*.local` files for development and test environments based on `env.*.local.example` files.

#### Database

Run `bundle exec rails db:create db:migrate db:seed` to create the database and fill it with seeds if you are not using docker.
If you are using docker run `docker-compose exec rails rake db:seed`
Seed user account data:
email: `user@example.com`
password: `password`

#### Linters

Setup [overcommit](https://github.com/sds/overcommit) to run linters and udpate GraphQL schema automatically before every commit

#### Credentials

Run `EDITOR=nano bundle exec rails credentials:edit --environment test` and `EDITOR=nano bundle exec rails credentials:edit --environment test`
to edit credentials.
Note: This app was created for educational purposes. It contains `development.key` and `test.key`.
Always add your keys to .gitignore in real-life applications.  

#### Running application with Docker

Run `docker-compose up` (or `docker-compose up --build` if you've done some changes) to run the app on port 3000.
To enter rails console the container run `docker container exec -it graphql_meetup_rails_1 rails c`.
To stop the containers run `docker-compose down`.
To stop the containers and remove volumes run `docker-compose down --volumes`.
