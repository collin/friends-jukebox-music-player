class Pick < Sequel::Model(:picks)
  belongs_to :user
  belongs_to :song

  validates do
    presence_of :user_id
    presence_of :song_id
  end
end