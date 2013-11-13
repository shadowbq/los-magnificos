# encoding: utf-8
class Magnificos < Sinatra::Base
  
  # Create a default User
  if User.count == 0
    @user = User.create(username: "admin")
    @user.password = "password"
    @user.email = "admin@domain.org"
    @user.save
  end
    
end