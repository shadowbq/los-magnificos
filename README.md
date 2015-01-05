<p align="center">
<img src="https://raw.githubusercontent.com/shadowbq/los-magnificos/master/public/img/plan_b.png">
</p>

los-magnificos
==============
Sinatra Template => A-TEAM a.k.a  ***More Dakka***, DM Enabled, Users, Twitter Bootstrap, and Chrome plated Ruger Mini-14's.. 

This is a semi-useful example app that is fairly laughable. A very simple [Sinatra](http://www.sinatrarb.com/) application where the example pages from the [Twitter Bootstrap](http://twitter.github.com/bootstrap/) framework have been converted to [Haml](http://haml-lang.com/).

Note: This original example templates used were current as of Bootstrap v2.0.0.

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

```ruby
	@user.username = "admin"
    @user.password = "password"
    @user.email = "admin@domain.org"
```

Simple example provided

(http://localhost:9393/auth/login)

## ORM - Datamapper

Datamapper based ORM using SQLITE3 

An Example is:

  'Articles' Model & Controller and ORM to 5 instances (los-magnificos/db/development.db).

## Safe Shell Executions

Shellex provides interpolated Shell execution protection

```
a = "hello, world!"
puts shellex("echo ?", a).stdout

shellex("sleep 10", :timeout => 1) # raises ShellExecutionTimeout exception
```

## IP Access Control Lists

Alpca implements a strict IP access list at the Rack Level

Default Alpca Config:

```yaml
whitelist:
  - 0.0.0.1
  - 198.18.0.0/15
  - "::/128"
  - 127.0.0.1
blacklist:
  - 0.0.0.1
  - 0.0.0.2
  - "2001:db8::/32"
default: deny
```

## Rake Tasks

### Routes Dump from Sinatra

```shell
>$ rake routes

GET:
^/$
^/articles$
^/articles/new$
^/articles/([^/?#]+)$
^/articles/([^/?#]+)/edit$
^/csrf_secured$
^/csrf_unsecured_form_failing_check$
^/set(?:\-|%2D)flash$
^/auth/login$
^/auth/logout$
^/protected$
^/container(?:\-|%2D)app$
^/fluid$
^/hero$
^/starter(?:\-|%2D)template$

HEAD:
^/$
^/articles$
^/articles/new$
^/articles/([^/?#]+)$
^/articles/([^/?#]+)/edit$
^/csrf_secured$
^/csrf_unsecured_form_failing_check$
^/set(?:\-|%2D)flash$
^/auth/login$
^/auth/logout$
^/protected$
^/container(?:\-|%2D)app$
^/fluid$
^/hero$
^/starter(?:\-|%2D)template$

POST:
^/articles$
^/csrf_response$
^/set(?:\-|%2D)flash$
^/auth/login$
^/auth/unauthenticated$

PUT:
^/articles/([^/?#]+)$

DELETE:
^/articles/([^/?#]+)$
```
