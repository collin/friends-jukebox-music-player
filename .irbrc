__DIR__ = Pathname.new(__FILE__).dirname.expand_path
APP_ROOT = __DIR__

require 'sequel'
DB = Sequel.sqlite("database")
Dir.glob(__DIR__+"models"+"**"+"*.rb").each{|m| require m}
    