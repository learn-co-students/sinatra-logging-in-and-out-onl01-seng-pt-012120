require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
   if @user
     session[:user_id] = @user.id #this finds the correct user by db and logs them in
     redirect '/account'
   end
   redirect '/login'
  end

  get '/account' do

  end

  get '/logout' do

  end


end
