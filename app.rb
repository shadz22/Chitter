require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    "Chitter"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    'A test peep'
  end

  run! if app_file == $0
end