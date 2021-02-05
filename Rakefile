ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Runs a console in terminal'
task :console do 
    Pry.start
end
