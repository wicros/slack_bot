require 'sinatra/base'

module LincBot
  class Web < Sinatra::Base
    get '/' do
      'Math is good for you.'
    end
  end
end
