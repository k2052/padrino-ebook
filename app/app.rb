class PadrinoEbook < Padrino::Application
  register Padrino::Rendering  
  register Padrino::Cache   
  register Padrino::Helpers 
  register Padrino::Admin::AccessControl
  register Padrino::Flash
  register Padrino::Responders

  ## 
  # Assets
  #  
  register CompassInitializer
  register Padrino::Pipeline
  enable :sessions

  configure_assets do |config|
    config.pipeline = Padrino::Pipeline::Sprockets
  end

  ## 
  # Access Control
  #
  access_control.roles_for :any do |role|
    role.protect '/book'
    role.protect '/authenticated'
    role.protect '/charge'
  end

  access_control.roles_for :registered do |role|
    role.allow '/authenticated'
    role.allow '/charge'
  end

  access_control.roles_for :striped do |role|
    role.allow '/book'
  end

  use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user"
  end
end
