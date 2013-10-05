PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

require 'mocha/api'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.mock_with :mocha
end

OmniAuth.config.test_mode = true

FactoryGirl.definition_file_paths = [
  File.join(Padrino.root, 'spec', 'factories')
]
FactoryGirl.find_definitions

def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
