require 'sprockets'

# Append sprockets paths
Sprockets.append_path File.join Padrino.root, "app/assets/js"
Sprockets.append_path File.join Padrino.root, "app/assets/css"
Sprockets.append_path File.join Padrino.root, "bower_components"
Sprockets.append_path File.join Padrino.root, "vendor/assets/js"
Sprockets.append_path File.join Padrino.root, "vendor/assets/css"
