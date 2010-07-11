require "bundler" # bundler 0.9.26
Bundler.setup

require "rspec"
require "cucumber"

$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'github_organizations_scraper'

Before do
  @tmp_root = File.dirname(__FILE__) + "/../../tmp"
  @home_path = File.expand_path(File.join(@tmp_root, "home"))
  @lib_path  = File.expand_path(File.dirname(__FILE__) + "/../../lib")
  FileUtils.rm_rf   @tmp_root
  FileUtils.mkdir_p @home_path
  ENV['HOME'] = @home_path
end
