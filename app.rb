require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :home
end

get "/new" do
  erb :new
end

post "/create" do
  r = Restaurant.new
  r.name = params[:name]
  r.address = params[:address]
  r.image = params[:image]
  r.save

  redirect to('/')
end

get '/show/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end
