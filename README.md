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

### Other Heroku Commands 

Execute **rails db:migrate** on Heroku

    $ heroku run rails db:migrate
    
Enter into Sandbox Console    

    $ heroku run rails console --sandbox
    
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
    

### 6.1.1 Database migrations 

Create User model

    $ rails generate model User name:string email:string

Do changes effective on database
    
    $ rails db:migrate
    
Also, we could rollback changes:

    $ rails db:rollback
    
Other rails db commands: 

    $ rails db:reset                    #Recreate all schemas (DEVELOPMENT & TEST) 
    $ rails db:migrate:reset            #Same than previous
    $ rails db:migrate                  #Executes DB scripts on DEVELOPMENT environment 
    $ rails db:migrate RAILS_ENV=test   #Executes DB scripts on TEST environment



### 6.1.3 Creating user objects

(Playing with ActiveRecord) 
Entering into "Sandbox Console"

    $ rails console --sandbox
    
    user = User.new(name: "Michael Hartl", email: "michael@example.com")
    user.save
    
    User.create(name: "A Nother", email: "another@example.org")

    foo = User.create(name: "Foo", email: "foo@bar.com")
    foo.destroy

### Other Rails Console commands

    $ rails console
    $ rails console test
    $ rails console --sandbox
           
### 6.1.4 Finding user objects    

    User.find(1) 
    User.find_by(email: "michael@example.com")

    User.first
    
    User.all
   
    
### 6.1.5 Updating user objects

Updating user
    
    user.email = "mhartl@example.net"
    => "mhartl@example.net"
    user.save
    
or

    user.update(name: "The Dude", email: "dude@abides.org")
   
or just for one attribute 

    user.update_attribute(:name, "El Duderino")
    
Reloading data from db 

    user.email 
    => "mhartl@example.net" 
    user.email = "foo@bar.com" 
    => "foo@bar.com" 
    user.reload.email => "mhartl@example.net"
    
### 6.2.1 A validity test

Run All Tests

    $ rails test

Run Model Tests

    $ rails test:models 
    
Run Integration Tests
    
    $ rails test:integration
    
### 6.2.5 Uniqueness validation
 
Create a empty migration 

    $ rails generate migration add_index_to_users_email
    
Fill it with something like

    class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
        def change
            add_index :users, :email, unique: true
        end
    end
    
Execute Migrate

    $ rails db:migrate
    
    
### 6.3.2 User has secure password 
    
    $ rails generate migration add_password_digest_to_users password_digest:string

    $ rails db:migrate
    
### 7.1.3 Debugger

    If we want to "Debug" we can use the IDE debugger, but also use the **debugger** command.
    
    If we insert **debuger** it will stop on that line, opening a smart console where we can do commands
    
    Command **continue* will continue the execution of the program

### 7.3.4 A test for invalid submission

Generate empty Integration Test
 
    $ rails generate integration_test users_signup
    
### 8.1.1 Sessions controller 

Generate Sessions Controller 

    $ rails generate controller Sessions new
    
### 8.1.5 A flash test    
    $ rails generate integration_test users_login
    
### 8.2.3 Changing the layout links

Install both jQuery and Bootstrap 

    $ yarn add jquery@3.4.1 bootstrap@3.4.1

### 9.1.1 Remember token and digest

Generate migration to add **remember_digest**

    $ rails generate migration add_remember_digest_to_users remember_digest:string
    
    $ rails db:migrate
    
### 9.4 Conclusion

If there are db changes due to migrate into Heroku Db, it is recommended
to do it like this

    $ heroku maintenance:on
    $ git push heroku
    $ heroku run rails db:migrate
    $ heroku maintenance:off
    
### 10.1.3 Testing unsuccessful edits 

Generate Integration Test for "Users_Edit"
 
    $ rails generate integration_test users_edit
    
### 10.3.2 Sample users

After update **Gemfile**:

    $ bundle install
    
And call the seeds.rb script with: 

    $ rails db:migrate:reset 
    $ rails db:seed
    
    
### 10.3.4 Users index test

Generate Integration Test "users_index"

    $ rails generate integration_test users_index
    
Generate Migration to add admin:boolean to users 

    $ rails generate migration add_admin_to_users admin:boolean
    
    $ rails db:migrate
  
 ### 10.5 Conclusion

    $ heroku maintenance:on
    $ git push heroku
    $ heroku pg:reset DATABASE  --confirm enigmatic-garden-86440
    $ heroku run rails db:migrate
    $ heroku run rails db:seed
    $ heroku maintenance:off
    
### 11.1.1 Account activations controller    

    $ rails generate controller AccountActivations
    
### 11.1.2 Account activation data model
    
    $ rails generate migration add_activation_to_users activation_digest:string activated:boolean activated_at:datetime

    $ rails db:migrate:reset
    $ rails db:seed
    
    
### 11.2.1 Mailer templates

    $ rails generate mailer UserMailer account_activation password_reset
    
### 11.4 Email in production

Add SendGrid to Heroku (to send email)  

    $ heroku addons:create sendgrid:starter
    
(restart database as in **10.5 Conclusion**)

### 12.1.1Password resets controller

    $ rails generate controller PasswordResets new edit --no-test-framework
    
    
### 12.1.2 New password resets
    
    $ rails generate migration add_reset_to_users reset_digest:string reset_sent_at:datetime    
    
### 12.3.3 Password reset test

    $ rails generate integration_test password_resets
    
### 13.1.1 The basic model

    $ rails generate model Micropost content:text user:references

After all changes
 
    $ rails db:migrate
    
### 13.2.1 Rendering microposts 

    $ rails db:migrate:reset 
    $ rails db:seed
    
    $ rails generate controller Microposts

### 13.2.3 Profile micropost tests
    
    $ rails generate integration_test users_profile