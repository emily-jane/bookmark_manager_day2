require_relative 'data_mapper_setup'

require 'sinatra/base'

class App < Sinatra::Base

set :views, proc { File.join(root, ".." "views") }

get '/links' do
	@links = Link.all
	erb :'links/index'
end

end