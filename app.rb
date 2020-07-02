require 'sinatra/base'

class Chitter < Sinatra::base

  get '/' do
    "Chitter"
  end

  run! if app_file == $0
end