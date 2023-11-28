# frozen_string_literal: true

When /I click on edit for (.*)/ do |news_article|
  find(:xpath, "//tr[contains(.,'#{news_article}')]/td/a", text: 'Edit').click
end

When /I click on add news article/ do
  find('a.btn-primary').click
end
