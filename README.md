# README

#### ENV variables

Create `env.*.local` files for development and test environments based on `env.*.local.example` files.

#### Credentials

Run `EDITOR=nano bundle exec rails credentials:edit --environment test` and `EDITOR=nano bundle exec rails credentials:edit --environment test`
to create/edit credentials. You can find an example of the credentials is in the `credentials.yml.example` file.

#### Database

Run `bundle exec rails db:create db:migrate db:seed` to create the database and fill it with seeds.


#### Linters

Setup [overcommit](https://github.com/sds/overcommit) to run linters and udpate GraphQL schema automatically before every commit
