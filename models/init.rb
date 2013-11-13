DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/development.db")

require_relative 'article'
require_relative 'user'


DataMapper.finalize.auto_upgrade!