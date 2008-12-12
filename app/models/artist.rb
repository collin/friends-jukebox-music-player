class Artist
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String,
    :length => 255,
    :unique => true,
    :index  => true
    
  has n, :tracks
  
  def self.find_or_create_by_name name
    record = first(:name => name)
    if record.nil?
      create(:name => name)
    else
      record
    end
  end
  
  def name
    value = attribute_get :name
    value.blank? ? 'Unidentified Artist :(' : value
  end
  
  def accolade
    "the #{adjective} #{name}"
  end
  
  def goofy_name
    "#{verb} by #{accolade}"
  end
  
  def verb
    %w{performed played created originated presented}.random
  end
  
  def adjective
    %w{wonderful excellent awesome super-cool magical unparalleled}.random
  end
end
