
class Magnificos < Sinatra::Base
  
  configure do
    set :method_override, true
    set :environment, :development
  end
  
=begin
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = Magnificos
    manager.serialize_into_session {|user| user.id}
    manager.serialize_from_session {|id| Datastore.for(:user).find_by_id(id)}
  end
 
  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end
  
  Warden::Strategies.add(:password) do
    def valid?
      params["email"] || params["password"]
    end

    def authenticate!
      user = Datastore.for(:user).find_by_email(params["email"])
      if user && user.authenticate(params["password"])
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end
=end  
  

  
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
  
  get '/csrf_secured' do
    erb :csrf_secured_form
  end
  
  get '/csrf_unsecured_form_failing_check' do
    erb :csrf_unsecured_form_failing_check
  end

  post '/csrf_response' do
    erb :csrf_response, :locals => {:utterance => params[:utterance],
      :csrf => params[Rack::Csrf.field]}
  end

  require_relative 'controllers/init'

end

require_relative 'helpers/init'
require_relative 'models/init'
