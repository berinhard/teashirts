require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end


task :deps do
  exec 'bundle'
end


task :run do
  exec 'foreman start -f Procfile.dev'
end


task :default => [:run]