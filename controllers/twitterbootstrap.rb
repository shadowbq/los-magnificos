class Magnificos < Sinatra::Base
  
  %w(container-app fluid hero starter-template).each do |view|
    get "/#{view}" do
      #haml view.to_sym
      haml :"twitterbootstrap/#{view}"
    end
  end
  
end  