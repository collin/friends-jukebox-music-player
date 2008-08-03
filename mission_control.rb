require 'gen'
require 'legs'

Legs.start do 
  def say(message, cookie)
    current_user = User.find(cookie.split("=").last.unpack('*m').first[:user_id])
    broadcast :said, current_user.name, message
    reutrn "ok"
  end

  def next_track(data)
    broadcast :play, Song.first.url
    return "ok"
  end
end

sleep