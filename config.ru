$LOAD_PATH << '.'

require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'

require 'haml'
require 'erb'
require 'warden'
require 'rack/csrf'

require 'rack/protection'

require 'data_mapper'
require 'bcrypt'

require 'rack-flash'

require 'pry'

use Rack::Alpaca

use Rack::ShowExceptions
use Rack::Session::Cookie, :secret => "MySup3rS3cr3tS@ltIsTh1s!"

use Rack::Csrf, :raise => true
use Rack::Protection
#use Rack::Protection::EscapedParams

use Rack::Flash, accessorize: [:error, :success]


require 'app'

run Magnificos