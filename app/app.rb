require_relative 'data_mapper_setup'
require_relative 'models/link.rb'
require 'sinatra/base'

class App < Sinatra::Base
# set :views, proc { File.join(root, ".." "views") }
get '/links' do
	@links = Link.all
	erb :'links/index'
end

get '/links/new' do
	erb :'links/new'
end

post '/links' do
	Link.create(url: params[:url], title: params[:title])
	redirect to ('/links')
end

end