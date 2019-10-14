# Rails (6) Tutorial (6th Edition)

Links: 
* <https://enigmatic-garden-86440.herokuapp.com>

## Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ rails server
```
For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).

## Chapter 3. Mostly Static Pages

### Sample App init
    $ rails _6.0.0_ new sample_app
    $ cd sample_app
    $ rails server
(browse for <http://localhost:3000> )

### Setup for Mysql 5.7
* On this Commit (these steps are based on `rails new sample_app -d
  mysql`:
  * Added 'mysql2' gem to **Gemfile**
  * Added Mysql Configuration to **database.yml** 
    
 Into Mysql Server, it is necessary to create a user:
 **sample_app_user** with pass: **sample_app_pass** with privileges over
 **sample_app_%** schemas

With this command:
 
    $ rails db:create 
    
It will create the necessary test and development databases

### Deploy to Heroku

* On this Commit: 
  * Gemfile: 
    * moved **mysql2** gem to group :development, :test 
    * included **pg** gem into group :production

Remember to do (at least once):

    bundle install --without production

Install Heroku CLI with: 

    $ curl https://cli-assets.heroku.com/install.sh | sh

Login Interactively with:

    $ heroku login --interactive

Create Heroku Repo  with:

    $ heroku create

Git PUSH to Heroku 

    $ git push heroku master
    
DONE!
    
### Added Gems for Rails Tutorial

* On this Commit: 
  * Gemfile: 
    * added gems for Rails Tutorial (:test)

### 3.2.1 Generated static pages
Generate StaticPagesController 
    
    $ rails generate controller StaticPages home help
    
### 3.3.1 Our first test

    $ rails db:migrate # Necessary on some systems 
    $ rails test

### 3.6.2 Automated tests with Guard

Generate init **Guardfile** 

    $ bundle exec guard init
    
Also **Guardfile** needs some configuration (added on this commit)

Guard is watching permanently for tests 

To execute Guard (on a terminal)

    $ bundle exec guard
    
    $ bin/spring stop # Try this if the tests mysteriously start failing. 
    $ bundle exec guard

### 5.3.4 Layout link tests

Generate Integration Test for Site Layout
 
    $ rails generate integration_test site_layout
    
### 5.4.1 Users controller    

Generate Users Controller

    $ rails generate controller Users new
    

    