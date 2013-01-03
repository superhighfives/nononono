# app.rb
require 'compass'
require 'sinatra'
require 'haml'
require 'sass'
require 'maruku'
require 'coffee-script'

module NonononoUtils
  def self.getText(reference)
    domain = reference.split('.').first.gsub!(/-/, ' ')
    return domain unless domain == 'nononono'
  end
end

helpers NonononoUtils

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

get '/' do
  haml :index, :locals => {:request_host => request.host}
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

get '/javascripts/:name.js' do
  content_type 'text/javascript'
  coffee :"/javascripts/#{params[:name]}"
end