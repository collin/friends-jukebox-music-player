class Follow < ActiveRecord::Base
  validates_presence_of :follower_id
  validates_presence_of :following_id
  
  belongs_to :follower, :class_name => 'Friend'
  belongs_to :following, :class_name => 'Friend'
  
  attr_accessible :follower_id, :following_id
  
  def reciprocate
    update_attribute :reciprocated, true
    r = Follow.create :follower_id => following.id, 
      :following_id => follower.id
    r.update_attribute :reciprocated, true
  end
  
  def ignore
    update_attribute :ignored, true
  end
end
