class Playlist < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  
  belongs_to :friend
  has_many :songs
end
