require Merb.root+'/gems/gems/bcrypt-ruby-2.0.3/lib/bcrypt'

class Friend < ActiveRecord::Base
  include BCrypt
  attr_accessible :email, :name, :password_confirmation
  
  validates_presence_of :email
  validates_presence_of :name
  
  validates_uniqueness_of :email
  validates_uniqueness_of :name
  
  validates_presence_of :password, :if => :new_record?
  validates_presence_of :password_confirmation, :if => :new_record?
  validates_confirmation_of :password, :if => :new_record?

  named_scope :admins, :conditions => {:admin => true}

  has_many :playlists

  has_many :following_follows, 
    :class_name => 'Follow', 
    :foreign_key => 'follower_id'
  
  has_many :followed_follows, 
    :class_name => 'Follow', 
    :foreign_key => 'following_id'
    
=begin  
  has_many :followers, 
    :through => :followed_follows
    
  has_many :followings, 
    :through => :following_follows,
=end 
  has_many :friends, 
    :through => :following_follows,
    :source => :following,
    :conditions => {'follows.reciprocated' => true}

  has_many :requests, 
    :through => :followed_follows,
    :source => :following,
    :conditions => {'follows.reciprocated' => false, 'follows.ignored' => false}
    
  has_many :pendings, 
    :through => :following_follows,
    :source => :follower,
    :conditions => {'follows.reciprocated' => false, 'follows.ignored' => false} 

  def others
    Friend.all - friends - [self]
  end

  def password
    @password ||= Password.new(self.crypted_password)
  end
 
  def password=(password)
    @password = Password.create(password)
    self.crypted_password = @password
  end
  
  def public_json
    {
      :id => self.id,
      :name => self.name,
      :email => self.email
    }.to_json
  end
end
