require_relative 'fusco'
require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' unless production?

fusco = Fusco.new

get '/' do
  haml :index
end

post '/' do
  begin
    json output: fusco.go(params[:string])
  rescue ArgumentError => ex
    json error: ex.message
  end
end
