get '/' do
  @short_urls = Url.all
  erb :index
end

post '/urls' do
  Url.create_url(params[:long_url])
  redirect to('/')
end

get '/:short_urls' do |short|
  long = Url.get_short(short)
  redirect to(long)
end
