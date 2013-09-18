require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run the bank sample application"
task :run do
  ruby "bank.rb"
end