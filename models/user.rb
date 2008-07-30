class User < Sequel::Model(:users)
  include BCrypt
  
  has_many :picks

  validates_presence_of :name

  def password
    @password ||= Password.new(hash)
  end

  def password=(password)
    @password = Password.create(password)
    self[:hash] = @password
  end
end