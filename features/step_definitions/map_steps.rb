# frozen_string_literal: true

When /I click on the state (.*)/ do |_state|
  redirect_to '/login'
end

When /I click Counties in (.*)/ do |_state|
  puts page.body
end

Then /I should see (.*) counties/ do |num|
  puts num
end
