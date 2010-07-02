require 'rubygems'
require 'spec/rake/spectask'

require "bundler"
Bundler.setup

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

task :default => :spec
