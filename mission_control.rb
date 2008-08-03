require 'gen'
require 'legs'

Legs.start do 
  def say(message, cookie)
    current_user = User.find(cookie.split("=").last.unpack('*m').first[:user_id])
    broadcast :said, current_user.name, message
    "ok"
  end

  def next_track(data)
    broadcast :play, Song.all.last.url
    "ok"
  end
end

sleep