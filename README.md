# Rails (6) Tutorial (6th Edition)

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

