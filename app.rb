require 'rubygems'
require 'pathname'
require 'sequel'
require 'bcrypt'

__DIR__ = Pathname.new(__FILE__).dirname.expand_path

%w{sinatra jabs}.each do |lib|
  $:.unshift(__DIR__ + lib + 'lib')
  require lib
end

DB = Sequel.sqlite("database")
Dir.glob(Pathname.new(__DIR__ + "models"+"*.rb")).each{|m| load m}

use Rack::Session::Cookie, :key => "$2a$10$3fokcYU3K8geKYJA2bjB1"

ClosedURLs = %w{
  /jukebox
  /friends
  /player
  /listen
  /signout
}

before do
  @current_user = User.find session[:user_id]
  if ClosedURLs.include?(request.env["REQUEST_URI"])
    unless @current_user
      session[:flash] = "Oh no+ what ?you to do? Sign in knave!"
      redirect "/"
    end
  end
end

get "/" do
  redirect "/jukebox" if @current_user
  haml :welcome
end

get "/friends" do
  haml :friends
end

get "/listen" do
  haml :listen
end

get "/jukebox" do
  haml :jukebox
end

get "/player" do
  haml :player
end

get "/about" do
  haml "A little jukebox for listening to music with your friends."
end

get "/application.js" do
  content_type 'text/javascript', :charset => 'utf-8'
  jabs :application
end

post "/signup" do
  @current_user = User.new :name => params[:name]
  @current_user.password = params[:password]
  if @current_user.save
    session[:user_id] = @current_user.id
    session[:flash] = "Welcome to Friends' Jukebox Music Player"
    redirect "/jukebox"
  else
#     @current_user = nil
    session[:flash] = "What went wrong? We want you to sign up!"
    redirect "/"
  end
end

post "/signin" do
  @current_user = User.find_by_name(params[:name])
  if @current_user && @current_user.password = params[:password]
    session[:user_id] = @current_user.id
    session[:flash] = "Welcome back to Friends' Jukebox Music Player"
    redirect "/jukebox"
  else
    @current_user = nil
    session[:flash] = "Try it again buddy. Maybe you need to sign up?"
    redirect "/"
  end
end

delete "/signout" do
  @current_user = nil
  session[:user_id] = 0
  session[:flash] = "Thanks for listening. Come back soon!"
  redirect "/"
end

def jabs target
  if target.is_a? Symbol
    Jabs::Engine.new(Pathname.new("views/#{target.to_s}.jabs").read).render
  elsif target.is_a? String
    Jabs::Engine.new(target).render
  end
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def partial(name, options={})
    haml(name, options.merge(:layout => false))
  end
end