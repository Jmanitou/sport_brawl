require './config/environment'
require 'pry'
require './app/models/user'
require './app/models/event'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Sport_Brawl"
  end
  
  helpers do 
    def signed_in?
      session[:user_id]
    end
    
    def current_user
      current_user = User.find(session[:user_id])
    end
    
    def error
      session[:error]
    end
  end
  
  get '/' do
    @events = Event.all
    @user = User.find_by(:id => session[:user_id])
    erb :index
  end
  
  get '/event' do
    @user = User.find_by(:id => session[:user_id])
    erb :event
  end
  
  post '/event' do
    date = "#{params[:DOBMonth]} #{params[:DOBDay]} #{params[:DOBHour]}:#{params[:DOBMinute]} #{params[:DOBAMPM]}"
    
Event.create(:user_id => params[:user_id], :event => params[:event], :date => date, :skill_level => params[:skill_level], :location => params[:location], :gender => params[:gender], :number_of_people => params[:number_of_people], :sport => params[:sport], :event_description => params[:event_description], :event_image => params[:event_image])
    redirect '/'
  end
  
  get '/event_list' do
    @events = Event.all
    @user = User.find_by(:id => session[:user_id])
    erb :event_list
  end
  
  post '/subscribe' do
    @user = User.find_by(:id => session[:user_id])
    #Subscription.create(:user_id => params[:user_id], :event_id => params[:event_id])
        
    redirect '/event'
  end
  
  get '/profile' do
    @user = User.find_by(:id => session[:user_id])
    erb :profile
  end
  
  get '/users' do
    @users = User.all
    erb :users
  end
  
  post '/sign-up' do    
    @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :age => params[:age], :gender => params[:gender], :email => params[:email], :profile_pic => params[:profile_pic], :username => params[:username], :profile_pic => params[:profile_pic])
    @user.save
    session[:user_id] = @user.id
    redirect '/'
  end
  
  get '/sign-in' do
    @signin_page = true
    erb :signin
  end
  
  get '/map' do
    @user = User.find_by(:id => session[:user_id])
    erb :map
  end
  
  post '/sign-in' do
    @user = User.find_by(:username => params[:username], :email => params[:email])
    
    puts params[:username]
    puts params[:email]
    
    if @user
      session[:user_id] = @user.id
      puts @user.id
    end
    redirect '/profile'
  end

  get '/sign-out' do
    session[:user_id] = nil
    session[:error] = nil
    redirect '/'
  end
end