if ENV['MONGOLAB_URI']
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOLAB_URI']) 
elsif ENV['MONGOHQ_URL']
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL']) 
else 
  MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger) 
end

case Padrino.env
  when :development then MongoMapper.database = ENV['MONGO_DB']
  when :production  then MongoMapper.database = ENV['MONGO_DB']
  when :test        then MongoMapper.database = 'sprine_padrino_test'
end
