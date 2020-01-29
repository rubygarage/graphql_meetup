# README

#### ENV variables

Create `env.*.local` files for development and test environments based on `env.*.local.example` files.

#### Database

Run `bundle exec rails db:create db:migrate db:seed` to create the database and fill it with seeds.


#### Linters

Setup [overcommit](https://github.com/sds/overcommit) to run linters and udpate GraphQL schema automatically before every commit
