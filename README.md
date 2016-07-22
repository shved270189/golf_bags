# README

## Deployed
This code was deployed to heroku https://golf-products-test.herokuapp.com/

## Parts of task
* API documentation - https://golf-products-test.herokuapp.com/api_documentation
* Products view for API - https://golf-products-test.herokuapp.com/
* Calculator - https://golf-products-test.herokuapp.com/calculator
* Populate the DB with the products.json file
```bash
rake db:seed
```

## App running
See requirements below if you have troubles.
```bash
rake db:create # create database
rake db:seed # add seed data to database
rails s # for run server
```

## Tests
Run tests
```bash
rspec
```
Output:
```
...................................................

Finished in 1.29 seconds (files took 5.43 seconds to load)

51 examples, 0 failures

Coverage report generated for Unit Tests to /Users/bond/Projects/golf_bags/coverage. 26 / 26 LOC (100.0%) covered.
```

## Used

* Ruby 2.3.0
* Ruby on Rails 5.0
* Ember.js 2.6
* MongoDB
* Mongoid
* Grape
* Swagger
* Rspec

## Requirements
```bash
brew update
```
Node.js
```bash
brew install node
```
Ember-CLI and Bower
```bash
npm install -g ember-cli bower
```
MongoDB
```bash
brew install mongodb
```
RVM
```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash
```
Ruby
```bash
rvm install 2.3.0
rvm use 2.3.0
```
Bundler
```bash
gem install bundler
cd /path/to/cloned/project
bundle install
```
