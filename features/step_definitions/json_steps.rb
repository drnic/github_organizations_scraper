Then /^I should see valid JSON$/ do
  actual_output = File.read(@stdout)
  lambda { JSON.parse(actual_output) }.should_not raise_error(JSON::ParserError)
  puts actual_output
end
