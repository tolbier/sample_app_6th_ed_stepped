# Rails (6) Tutorial (6th Edition)

Links: 
* <https://ancient-sea-09989.herokuapp.com/>

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
It will create <https://ancient-sea-09989.herokuapp.com/>

Git PUSH to Heroku 

    $ git push heroku master
    
DONE!
    
    