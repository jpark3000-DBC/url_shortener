get '/' do
  @short_urls = Url.all
  erb :index
end

post '/urls' do
  u = Url.create_url(params[:long_url])
  if u.valid?
    redirect to('/')
  else
    erb :error
  end
end

get '/:short_urls' do |short|
  long = Url.get_short(short)
  redirect to(long)
end
