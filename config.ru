$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :development,
  :raise_errors => true,
  :app_file => 'web.rb'
)

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)require 'web'
run Sinatra.application