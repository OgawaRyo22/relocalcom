require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require 'sinatra/activerecord'
require './models'

enable :sessions

helpers do
 def current_user
 User.find_by(id: session[:user])
end
end



get '/' do
 
 if current_user.nil?
  @tasks = Task.none
else
  @tasks = Task.all
end
 erb :index
end

get '/intro' do
 erb :intro
end

get '/sinki' do
 erb :sinki
end


post '/tasks' do
 
 Task.create({
   user_id: session[:user],
   title: params[:title],
   description: params[:description],
   location: params[:location],
   tag: params[:tag]
  })
 
 redirect '/'
end

get '/tasks', allows: [:id, :action] do
  erb :index
end

post '/sinki' do
 user = User.create(
 name: params[:name],
 email: params[:email],
 about: params[:about],
 password: params[:password],
 password_confirmation: params[:password_confirmation],
 user_name: params[:user_name],
 location: params[:location],
 tag: params[:tag]

 )
 if user.persisted?
 session[:user] = user.id
 end
 redirect '/'
end

post '/users' do
user = User.find_by(email: params[:email])
if user && user.authenticate(params[:password])
session[:user] = user.id
end
redirect '/'
end

get '/signout' do
session[:user] = nil
redirect '/'
end

post '/tasks/:id/delete' do
task = Task.find(params[:id])
task.destroy
redirect '/'
end



post '/tasks/:id/' do
@task = Task.find(params[:id])
@task.title = params[:title]
@task.description = params[:description]
@task.location = params[:location]
@task.tag = params[:tag]
@task.save
redirect '/'
end