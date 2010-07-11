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

desc "Refetch fixture pages used in tests"
task :refetch_fixtures do
  fixtures = File.dirname(__FILE__) + "/features/fixtures"
  %w[engineyard drnic].each do |account|
    sh "curl http://github.com/#{account} > #{File.join(fixtures, account + '.html')}"
  end
end