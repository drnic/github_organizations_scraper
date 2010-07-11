# a version of the bin/tweet-tail file
When /^I run the executable with arguments "([^\"]*)"$/ do |args|
  require 'rubygems'
  require File.dirname(__FILE__) + "/../../lib/github_organizations_scraper"
  require "github_organizations_scraper/cli"
  @stdout = File.expand_path(File.join(@tmp_root, "executable.out"))
  in_project_folder do
    GithubOrganizationsScraper::CLI.execute(@stdout_io = StringIO.new, args.split(" "))
    @stdout_io.rewind
    File.open(@stdout, "w") { |f| f << @stdout_io.read }
  end
end
