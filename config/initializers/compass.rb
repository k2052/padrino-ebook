module CompassInitializer
  def self.registered(app)   
    require 'sass/plugin/rack' 
    require 'sprockets-sass'
    require "sassy-buttons"
    require "zurb-foundation"
    require "susy"
    
    Compass.configuration do |config|
      config.environment                = Padrino.env
      config.project_path               = Padrino.root
      config.sass_dir                   = 'assets/css'
      config.http_path                  = '/'
      config.css_dir                    = 'public/css'
      config.images_dir                 = 'public/images'
      config.http_images_path           = '/' + 'images'
      config.http_fonts_path            = '/' + 'fonts'
      config.javascripts_dir            = 'public/js'
      config.output_style               = :expanded
      config.http_generated_images_path = '/' + 'images'
    end  

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
