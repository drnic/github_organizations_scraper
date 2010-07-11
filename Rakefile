require "bundler"
Bundler.setup
Bundler.require :newgem

Hoe.plugin :newgem
Hoe.plugin :cucumberfeatures

h = Hoe.spec 'github_organizations_scraper' do
  self.developer 'Dr Nic Williams', 'drnicwilliams@gmail.com'
end
h.spec.add_bundler_dependencies

require 'newgem/tasks'
task :default => [:spec, :features]
