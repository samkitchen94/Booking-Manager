require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatbaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
