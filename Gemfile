

require 'rubygems'
source :gemcutter
eval(File.open("carrierwave.gemspec").read).dependencies.each do |dependency|
  gem dependency.name, dependency.requirements_list.first
end