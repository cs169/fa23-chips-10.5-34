
Given /the following representatives exist/ do |reps_list| 
  reps_list.hashes.each do |rep|
    Representative.create(name: rep[:name])
  end
end

Given /Gavin Newsom has the following news articles/ do |articles|
  rep_id = Representative.find_by(name: 'Gavin Newsom').id
  puts rep_id
  puts "*********************"
  articles.hashes.each do |article|
    updated_articles = rep[:news_items].append({title: article[:title], description: article[:description], link: article[:link]})
    rep.update(news_items: updated_articles)
  end
end

Given('Alexander Ocasio Cortez has the following news articles:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When('I click on news articles for Gavin Newsom') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then /I should see (.*) articles/ do |num|
  puts page.body
  assert_select "body tr", num
end

Then /There should be (.*) entry for (.*)/ do |num, name|
  puts num
  puts name
end