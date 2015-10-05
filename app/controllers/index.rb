require 'byebug'

get '/' do
  # let user create new short URL, display a list of shortened URLs
  @urls = Url.all 

  erb :index
end

post '/url' do
  # create a new Url
  # byebug
  # #generate short url
  @url = Url.new(long_url: params['long_url'])
  @url.shorten
  @url.save


  #redirect to root

  redirect '/'
end


get "/:short_url" do
	#find the long url

	@url = Url.find_by(short_url: params[:short_url])

	# byebug
	redirect to "#{@url.long_url}"

end