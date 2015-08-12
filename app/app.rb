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
	link = Link.new(url: params[:url], title: params[:title])
	params[:tags].split(' ').each do |tag_part|
		tag = Tag.create(name: tag_part)
		link.tags << tag
	end
	link.save
	redirect to ('/')
end

get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :index
end

end