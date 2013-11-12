los-magnificos
==============

Sinatra Template - Secure. DM, Users, Twitter Bootstrap

A very simple [Sinatra](http://www.sinatrarb.com/) application where the example pages from the [Twitter Bootstrap](http://twitter.github.com/bootstrap/) framework have been converted to [Haml](http://haml-lang.com/).

This original example templates used were current as of Bootstrap v2.0.0.

## Installation

```ruby
bundle install
```

## Running 

`rackup`

You should now be able to view the application at [localhost:9292](http://localhost:9292).

`shotgun config.ru`

You can also run it with shotgun at [localhost:9393](http://localhost:9393).

## CSRF Security

CSRF_RACK protection 

## Warden

Rack-based authentication

## ORM - Datamapper

Datamapper based ORM using SQLITE3 

## Safe Shell Executions
```
a = "hello, world!"
puts shellex("echo ?", a).stdout

shellex("sleep 10", :timeout => 1) # raises ShellExecutionTimeout exception
```