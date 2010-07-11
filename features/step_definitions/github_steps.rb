Given /^a github (organization|user) "([^"]*)"$/ do |account_type, account|
  body = File.read(File.dirname(__FILE__) + "/../fixtures/#{account}.html")
  FakeWeb.register_uri(:get, "http://github.com/#{account}", :body => body)
end
