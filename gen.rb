require 'rubygems'
require 'pathname'
require 'sequel'
require 'bcrypt'
require 'tempfile'
require 'uuid'
require 'id3lib'

__DIR__ = Pathname.new(__FILE__).dirname.expand_path
APP_ROOT = __DIR__

db = Sequel.sqlite("database")
Dir.glob(Pathname.new(__DIR__ + "models"+"*.rb")).each{|m| load m}

SessionId = "$2a$10$3fokcYU3K8geKYJA2bjB1"