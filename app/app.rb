require_relative 'data_mapper_setup'
require_relative 'models/link.rb'
require 'sinatra/base'

class App < Sinatra::Base
# set :views, proc { File.join(root, ".." "views") }
get '/' do
	@links = Link.all
	erb :index
end

get '/new' do
	erb :new
end

post '/' do
	Link.create(url: params[:url], title: params[:title])
	redirect to ('/')
end

end