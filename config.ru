$:.unshift(File.expand_path("lib", File.dirname(__FILE__)))

require "app"

run App.freeze.app
