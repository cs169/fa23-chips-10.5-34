# frozen_string_literal: true

When /I click on edit for (.*)/ do |news_article|
  find(:xpath, "//tr[contains(.,'#{news_article}')]/td/a", text: 'Edit').click
end

When /I click on add news article/ do
  find('a.btn-primary').click
end

When /I visit the create news item page/ do
  visit path_to('the create news item page')
end

When /I am authenticated/ do
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
end
