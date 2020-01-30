# README

#### ENV variables

Create `env.*.local` files for development and test environments based on `env.*.local.example` files.

#### Database

Run `bundle exec rails db:create db:migrate db:seed` to create the database and fill it with seeds.


#### Linters

Setup [overcommit](https://github.com/sds/overcommit) to run linters and udpate GraphQL schema automatically before every commit

#### Credentials

Run `EDITOR=nano bundle exec rails credentials:edit --environment test` and `EDITOR=nano bundle exec rails credentials:edit --environment test`
to edit credentials.
Note: This app was created for educational purposes. It contains `development.key` and `test.key`.
Always add your keys to .gitignore in real-life applications.  
