# frozen_string_literal: true

Given('I am on the campaign finances page') do
  visit campaign_finance_index_path
end

Then('I am on the campaign finances search page') do
  visit search_campaign_finance_index_path
end

When('I navigate to the Events page') do
  visit events_path
end

Then('I should see financial data for top candidates') do |content|
  expect(page).to have_content(content)
end
