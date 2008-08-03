require 'gen'

__DIR__ = Pathname.new(__FILE__).dirname.expand_path
APP_ROOT = __DIR__

%w{sinatra jabs}.each do |lib|
  $:.unshift(__DIR__ + lib + 'lib')
  require lib
end

use Rack::Session::Cookie, :key => SessionId

closed_urls = %w{
  /jukebox
  /friends
  /player
  /listen
  /signout
  /songs
}

before do
  @current_user = User.find session[:user_id]
  if closed_urls.include?(request.env["REQUEST_URI"])
    unless @current_user
      session[:flash] = "Oh no+ what ?you to do? Sign in knave!"
      redirect "/"
    end
  end
end

get "/main.css" do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :main
end

post "/songs" do
  song =  request.env["rack.request.form_hash"]["file"]
  name = song[:filename]
  loc = song[:tempfile].path
  x_loc = Tempfile.new("step").path

  uuid = UUID.new

# MP3 to the rescue
#   system "mplayer -ao pcm \"#{loc}\" -ao pcm:file=\"#{x_loc}\" && nice oggenc -q0 \"#{x_loc}\" -o \"./public/songs/#{name}.ogg\"; rm \"#{loc}, #{x_loc}\""

# FLV to the rescue
#   system "mplayer -ao pcm \"#{loc}\" -ao pcm:file=\"#{x_loc}\" && nice lame -h -b 64 \"#{x_loc}\" \"./public/songs/#{uuid}.mp3\"; rm \"#{loc}, #{x_loc}\""

  system "mplayer -ao pcm \"#{loc}\" -ao pcm:file=\"#{x_loc}\" && nice lame --resample 44.1 -h -b 64 \"#{x_loc}\" \"./public/songs/#{uuid}.mp3\"; rm \"#{loc}, #{x_loc}\""
  
  system "ffmpeg -i \"./public/songs/#{uuid}.mp3\" -acodec copy \"./public/songs/#{uuid}.flv\""

  Song.create :url => "/songs/#{uuid}.flv"
  session[:flash] = "Thanks for your song!"
  redirect "/jukebox"
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
    @current_user = nil
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