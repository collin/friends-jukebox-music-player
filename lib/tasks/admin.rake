require 'pp'
require 'colored'
namespace :create do
  task :admin => :merb_env do
    pass = HighLine.new.ask("Enter your password:  " ) { |q| q.echo = "*" }
    conf =  HighLine.new.ask("Confirm your password:  " ) { |q| q.echo = "*" }
    email = HighLine.new.ask("Enter your email address:  " )
    name = HighLine.new.ask("Enter your name:  " )
    
    u = Friend.new :password_confirmation => conf,
      :email => email,
      :name => name
    
    u.password = pass
    
    u.save
    
    unless u.valid?
      puts u.errors.full_messages.map(&:red).map(&:bold)
    else
      u.update_attribute :admin, true
      puts "#{u.name} is now a jukebox king, congratulations".green.bold
    end
  end
  
  task :friend => :merb_env do
    name = HighLine.new.ask("Enter your name:  " )
    u = Friend.new :password_confirmation => '123456',
      :email => "#{name}@email.com",
      :name => name
    u.password = '123456'
    
    u.save
    unless u.valid?
      puts u.errors.full_messages.map(&:red).map(&:bold)
    else
      puts "#{u.name} is now a jukebox hustler, congratulations".green.bold
    end
  end
end
