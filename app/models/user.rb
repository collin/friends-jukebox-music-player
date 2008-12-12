class User
  include DataMapper::Resource
  
  property :id,     Serial
  property :email,  String,
    :length => 255,
    :format => :email_address

  has n, :followings
  
  has n, :following_users,
    :through => :followings, 
    :class_name => "User",
    :child_key => [:follower_id],
    :remote_name => :followee
    
  has n, :followed_by_users,
    :through => :followings,
    :class_name => "User",
    :child_key  => [:followee_id],
    :remote_name => :follower


  def potential_followees
    not_self - following_users
  end
  
  def not_self
    self.class.all(:id.not => self.id)
  end
end
