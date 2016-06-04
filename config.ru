require './app'
require 'sprockets'
run Sinatra::Application

environment = Sprockets::Environment.new
environment.append_path 'public/bower_components/bootstrap'
environment.append_path 'public/bower_components/angular-bootstrap'
environment.append_path 'public/bower_components'
environment.append_path 'public/node_modules'
environment.append_path 'public/js'
environment.append_path 'public/css'
environment.append_path 'public/images'
environment.append_path 'public/templates'
