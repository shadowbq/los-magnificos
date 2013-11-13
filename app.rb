
require_relative 'models/init'

class Magnificos < Sinatra::Base
  
  configure do
    set :method_override, true
    set :environment, :development
  end
  
  
  use Warden::Manager do |config|
    # Tell Warden how to save our User info into a session.
    # Sessions can only take strings, not Ruby code, we'll store
    # the User's `id`
    config.serialize_into_session{|user| user.id }
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session{|id| User.get(id) }

    config.scope_defaults :default,
      # "strategies" is an array of named methods with which to
      # attempt authentication. We have to define this later.
      strategies: [:password],
      # The action is a route to send the user to when
      # warden.authenticate! returns a false answer. We'll show
      # this route below.
      action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  #

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      (params['user']['username'] && params['user']['password']) rescue false
    end

    def authenticate!
      
      user =  User.first(username: params['user']['username'])
      #binding.pry
      if user.nil?
        fail!("Unknown username password combination.")
        #flash[:error] = ""
      elsif user.authenticate(params['user']['password'])
        #flash[:success] = "Successfully Logged In"
        success!(user)
      else
        fail!("Unknown username password combination.(2)")
      end
      
    end
  end
    
=begin  
  def warden_handler
    env['warden']
  end

  def check_authentication
    unless warden_handler.authenticated?
      redirect '/login'
    end
  end

  def current_user
    warden_handler.user
  end
=end
    
  get '/' do
    flash[:something] = "Something Else"
    haml :index
  end
  
=begin  
  get '/protected_pages' do
    check_authentication
    erb 'admin_only_page'.to_sym
  end

  %w(container-app fluid hero starter-template).each do |view|
    get "/#{view}" do
      haml view.to_sym
    end
  end
  
  get "/login" do
    erb '/login'.to_sym
  end

  post "/session" do
    warden_handler.authenticate!
    if warden_handler.authenticated?
      redirect "/users/#{warden_handler.user.id}" 
    else
      redirect "/"
    end
  end

  get "/logout" do
    warden_handler.logout
    redirect '/login'
  end

  post "/unauthenticated" do
    redirect "/"
  end
=end  
  

  require_relative 'controllers/init'

end

require_relative 'helpers/init'
