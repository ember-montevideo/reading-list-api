require "rake/testtask"

task :default => %w[test]

Rake::TestTask.new do |t|
  t.libs << "spec"
  t.test_files = FileList["spec/*_spec.rb"]
  t.verbose = true
end

desc "Run webserver"
task :serve do
  exec "rackup -p 3000 -s thin"
end
