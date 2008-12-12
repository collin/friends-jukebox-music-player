class Following
  include DataMapper::Resource
  
  property :id, Serial
  property :reciprocal, Boolean,
    :default  => false,
    :index    => true,
    :nullable => false
  
  belongs_to :follower, :class_name => 'User', :child_key => [:follower_id]
  belongs_to :followee, :class_name => 'User', :child_key => [:followee_id]
  
  validates_present :follower, :followee
  
  validates_with_block :followee do
    follower != followee ? true :
    [false, "You cannot follow yourself."] 
  end
  
  validates_is_unique :followee_id, :scope => [:follower_id]
end
