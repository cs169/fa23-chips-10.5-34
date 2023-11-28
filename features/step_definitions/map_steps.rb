# frozen_string_literal: true

When /I click on the state (.*)/ do |state|
  visit path_to('state')
end

When /I click Counties in (.*)/ do |state|
  puts state
end

Then /I should see (.*) counties/ do |num|
  puts num
end