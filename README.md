# FabLabs

[![Code Climate](https://codeclimate.com/github/fablabbcn/fablabs.png)](https://codeclimate.com/github/fablabbcn/fablabs) [![Build Status](https://travis-ci.org/fablabbcn/fablabs.io.png)](https://travis-ci.org/fablabbcn/fablabs.io) [![Test Coverage](https://codeclimate.com/github/fablabbcn/fablabs/badges/coverage.svg)](https://codeclimate.com/github/fablabbcn/fablabs/coverage)

## This is the official repository for fablabs.io platform project.

Fab labs provide widespread access to modern means for invention. They began as an outreach project from MIT’s Center for Bits and Atoms (CBA), and became into a collaborative and global network. You can find more information about Fab Labs on the [Fab Foundation Website](http://www.fabfoundation.org/).

If you are a Fab labs entusiast and/or you would like to contribute to the project please feel free to get in touch by [opening a new issue](https://github.com/fablabbcn/fablabs/issues/new).


## Getting started

### Local development

1. `bower install`

1. `rake db:setup`

1. `rails s`

1. Add this to your `/etc/hosts`:

    `127.0.0.1   www.fablabs.local`
    `127.0.0.1   api.fablabs.local`

1. Visit [http://www.fablabs.local:3000](http://www.fablabs.local:3000)

### Tests

Run tests with:

`bundle exec rake`


### Starting with docker-compose

1. Add all the secrets to an `.env` file - Minimum example is in the `env.example` file

1. Also copy `cp config/application.example.yml config/application.yml`


1. Start the project:

   `docker-compose up web app`

1. Create database (only the first time):

   `docker-compose exec app rake db:setup`

   If bower does not successfully install do:

   `docker-compose exec app /usr/local/bin/bower install`

1. Add this to your `/etc/hosts`:

   `127.0.0.1   www.fablabs.local`

   `127.0.0.1   api.fablabs.local`


1. Visit [http://www.fablabs.local:3000](http://www.fablabs.local:3000)

1. API is served on [http://api.fablabs.local:3000](http://api.fablabs.local:3000)

1. Add test users and data with

    `docker-compose exec app rake db:seed`

    This will create a normal user (email=user@user.local, password=password) and an admin user
    (email=admin@admin.local, password=password)

1. Run tests with

   `docker-compose exec app rake db:setup RAILS_ENV=test`

   `docker-compose exec app rake spec`

1. If you make changes to the code, rebuild the app and deploy the new image

   `docker-compose build`

   `docker-compose up -d`

1. Backup your db at any time with the included script:

    ```
    ./scripts/docker-backup-db.sh
    ```

## API Documentation

Take a look at the [developer guide](https://docs.fablabs.io) for information on how to
integrate Fablabs.io in your application.

Check out also the [API Reference](https://docs.fablabs.io/swagger/index.html),
the [Examples](https://github.com/fablabbcn/examples.fablabs.io), and the [fablabs.js library](https://github.com/fablabbcn/fablabsjs).


## Production notes

If you are running in production:

- you need to setup the SSL hosts and .env vars from the docker-compose.yml
- you need to run the assets pipeline to update public/assets

`docker-compose exec app bundle exec rake tmp:clear`
`docker-compose exec app bundle exec rake assets:precompile`
`docker-compose restart app`


## Pull requests

All PRs are tested on Travis. Make sure the tests run fine.

## Versioning

Currently using this tool to manually handle versioning: https://github.com/gregorym/bump

Use this command to update the VERSION file + create a git tag

`bump patch --tag`

Then push the git tag with:

`git push --tags`

## License

This project is licensed under the GNU Affero General Public License v3.0 (AGPL) - see the [LICENSE.md](https://github.com/fablabbcn/fablabs.io/blob/master/LICENSE) file for details. </br>
