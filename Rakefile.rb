require 'rubygems'
require 'pathname'
require 'sequel'

__DIR__ = Pathname.new(__FILE__).dirname.expand_path

namespace :db do
  task :migrate do
    DB = Sequel.sqlite("database")
    last_migration = __DIR__+"models"+"migrations"+".last-migration"
    models = Dir.glob(__DIR__+"models"+"migrations"+"*.rb").reject{|m|
      File.mtime(m) < File.mtime(last_migration)
    }.sort{|x, y| x.mtime <=> y.mtime}

    models.each{|m| require m}

    unless models.length == 0
      new_mtime = File.mtime(models.last)
      last_migration.utime new_mtime, new_mtime
    end

    Object.constants.each do |cons|
      c = Object.const_get(cons)

      if c.superclass == Sequel::Migration
        c.apply(DB, :up)
        puts "migrated #{cons} up"
      end if c.is_a?(Class)
    end
  end
end