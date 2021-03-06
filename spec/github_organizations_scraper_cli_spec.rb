require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'github_organizations_scraper/cli'

describe GithubOrganizationsScraper::CLI, "execute" do
  before(:each) do
    @stdout_io = StringIO.new
    GithubOrganizationsScraper::CLI.execute(@stdout_io, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  it "should print default output" do
    @stdout.should =~ /To update this executable/
  end
end