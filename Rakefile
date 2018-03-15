require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :hi do
  ruby 'lib/orgbots.rb'
end

task :rubocop do
  sh 'rubocop'
  sh 'htmlproofer test'
end
