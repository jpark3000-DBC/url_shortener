enable :sessions
require 'pry'
get '/abc' do
  erb :users
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user.nil?
    redirect to("/sign_in")
  else
    session[:user] = user.id
    redirect to('/secret_page')
  end
end

get '/secret_page' do
  id = session[:user]
  @user = User.find(id)
  @list_urls = User.find(id).addresses
  # binding.pry
  erb :secret
end

post '/sign_up' do
  user = User.create_user(params[:name], params[:email], params[:password])
  puts "#{user}"
  if user == nil
    redirect to('/')
  else
    session[:user] = user.id
    redirect to('/secret_page')
  end
end

get '/password' do
  User.find(session[:user]).password
end

get '/logout' do
  session.clear
  redirect to("/")
end


