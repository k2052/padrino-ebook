Padrino.configure_apps do
  set    :session_secret, ENV['SESSION_SECRET'] 
  set    :login_page,     '/sessions/new'
  set    :session_id,     ENV['SESSION_ID']
  enable :store_location
end

# Mounts the core application for this project
Padrino.mount('app', :app_class => 'PadrinoEbook').to('/')
