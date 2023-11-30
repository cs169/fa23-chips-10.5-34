Given('I am on the search page') do
  visit search_campaign_finance_index_path
end

When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

When('I select {string} from {string}') do |value, field|
  select(value, from: field)
end

When('I press {string}') do |button|
  click_button(button)
end

Then('I should see {string}') do |content|
  expect(page).to have_content(content)
end

Then('I should see financial data for top candidates') do
end
