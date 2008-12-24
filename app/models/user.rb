class User
  include DataMapper::Resource
  
  property :id,     Serial
  property :email,  String,
    :length => 255,
    :format => :email_address

end

