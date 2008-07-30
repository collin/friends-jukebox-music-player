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

get "/" do
  haml :welcome
end

get "/friends" do
  haml :friends
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
  User.create :name =>params[:user], 
    :password => params[:password]
  redirect "/jukebox"
end

post "/signin" do

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