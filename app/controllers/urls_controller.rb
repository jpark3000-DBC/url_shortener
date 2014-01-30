get '/' do
  @short_urls = Address.all
  erb :urls
end

post '/urls' do
  user_id = logged_in? ? session[:user] : nil
  u = Address.create_url(params[:long_url], user_id)
  if u.valid?
    redirect to('/')
  else
    erb :error
  end
end

get '/a/:short_urls' do |short|
  long = Address.get_short(short)
  redirect to(long)
end
