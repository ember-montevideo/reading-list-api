require "sequel"

if ENV["RACK_ENV"] == "development"
  require "logger"
  DB.loggers << Logger.new($stdout)
end

DB = Sequel.connect(ENV.delete("DATABASE_URL"))
