require 'bundler/setup'
require './handler'
require './auth_middleware'
require 'rack/parser'

use AuthMiddleware
use Rack::Parser, :content_types => {
  'application/json' => ->(body) { ::MultiJson.decode body }
}

run Sinatra::Application
