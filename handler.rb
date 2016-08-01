require 'sinatra'
require 'sinatra/json'

get '/' do
  json message: "Hello World, Ruby!"
end
