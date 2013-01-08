# app.rb
require 'compass'
require 'sinatra'
require 'haml'
require 'sass'
require 'maruku'
require 'coffee-script'

EASTER_EGGS = {
  'trolling' => {
    video: 'HyophYBP_w4',
    text: 'There is always time for trolling'
  },
  'arrested-development' => {
    video: 'YdGxkGk4taw',
    text: 'You get the hell out'
  },
  'csi-miami' => {
    video: '_sarYH0z948',
    text: 'No more puns?!'
  }
}

module NonononoUtils
  def self.getSubdomain(reference)
    reference.split('.').first
  end
  def self.getText(reference)
    reference.to_s.gsub('-', ' ')
  end
end

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

get '/' do
  subdomain = NonononoUtils.getSubdomain(request.host)
  override = EASTER_EGGS[subdomain]
  if override
    haml :index, :locals => {:text => override[:text], :video => override[:video]}
  else
    text = "No more #{NonononoUtils.getText(subdomain)}"
    video = '31g0YE61PLQ' # michael scott
    haml :index, :locals => {:text => text, :video => video}
  end
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

get '/javascripts/:name.js' do
  content_type 'text/javascript'
  coffee :"/javascripts/#{params[:name]}"
end