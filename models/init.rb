DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/development.db")

require_relative 'article'

DataMapper.finalize.auto_upgrade!