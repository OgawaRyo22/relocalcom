require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require 'sinatra/activerecord'
require './models'
require './image_uploader.rb'

enable :sessions

helpers do
 def current_user
 User.find_by(id: session[:user])
end
end



get '/' do



 if current_user.nil?

  @tasks = Task.none
  @tags = Tag.none

else
  @tasks = current_user.tasks
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

 task = Task.create({
   user_id: session[:user],

   title: params[:title],
   description: params[:description],
   location: params[:location],
   img:  ""
  })

if params[:file]
  image_upload(params[:file])
end

  tag = Tag.create({
    post_tag: params[:post_tag]
  })

  task_tag = TaskTag.create({
    task_id: task.id,
    tag_id: tag.id
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
    location: params[:location]
  )

  ustag = Ustag.create({
    ustag: params[:ustag]
  })

  user_tag = UserTag.create({
     user_id: user.id,
    ustag_id: ustag.id
  })

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
  tag = Tag.find(params[:id])
  task_tag = TaskTag.find(params[:id])
  task.destroy
  tag.destroy
  task_tag.destroy
  redirect '/'
end




post '/tasks/:id/' do
  task = Task.find(params[:id])
  tag = Tag.find(params[:id])
  task_tag = TaskTag.find(params[:id])
  task.title = params[:title]
  task.description = params[:description]
  task.location = params[:location]
  tag.post_tag = params[:post_tag]
  task.save
  task_tag.save
  tag.save
  redirect '/'
end
