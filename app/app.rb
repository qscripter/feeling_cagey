require File.expand_path(File.dirname(__FILE__) + '/boot')

require "sinatra"
require "sinatra/reloader"

set :server, :puma

get '/' do
  erb :index, :locals => {:name => "pecos"}
end

get '/:name' do
	erb :index, :locals => {:name => params[:name]}
end

get '/photos.json' do
  @photos = Photo.all_filtered_for_json

  content_type :json
  @photos.to_json
end