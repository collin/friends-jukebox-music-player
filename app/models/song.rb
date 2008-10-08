class Song < ActiveRecord::Base
  belongs_to :playlist
  validates_presence_of :url
  #acts_as_list :scope => :playlist
end
