# Rails101

Discussion forum project

* Register and Login
* Open new discussion area, comments
* Join/leave the discussion area
* Authorization
* Articles sorting
* RESTful

## ch04

Auth ([devise](https://github.com/heartcombo/devise))


* Install authentication solution -- devise 
  * gem 'devise'
  * `bundle install`
  * `rails generate devise:install`
  * replace MODEL with the class name used for the application’s users (it’s frequently User but could also be Admin) `rails generate devise MODEL`
  * `rails db:migrate`
  * Controller filters and helpers: To set up a controller with user authentication, just add this `before_action`
* Add signup/signon in navbar
* Only registered user can create group
* Only group owner can edit/delete group
