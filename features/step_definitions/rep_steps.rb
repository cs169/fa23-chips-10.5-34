# frozen_string_literal: true

Given /the following representatives exist/ do |reps_list|
  reps_list.hashes.each do |rep|
    Representative.create(name: rep[:name])
  end
end

Given /we have the following news articles/ do |articles|
  articles.hashes.each do |article|
    rep_id = Representative.find_by(name: article[:rep]).id
    NewsItem.create(
      title:             article[:title],
      description:       article[:description],
      link:              article[:link],
      representative_id: rep_id
    )
  end
end

When /I click on news articles for (.*)/ do |name|
  tr = page.find(:xpath, ".//tr[td='#{name}']/td/a")
  tr.click
end

Then /there should be (.*) articles/ do |num|
  num_rows = page.all('table tr').count
  # subtract 1 since the table header is technically a table row, but we don't want to count it
  expect(num_rows - 1).to eq(num.to_i)
end

Then /there should be (.*) entry for (.*)/ do |num, name|
  expect(Representative.where(name: name).count).to eq(num.to_i)
end
<<<<<<< HEAD

Given /the following representatives exist/ do |reps_list|
  reps_list.hashes.each do |rep|
    Representative.create(name: rep[:name], ocdid: rep[:ocdid],
    title: rep[:title], address: rep[:address], party: rep[:party], photo: rep[:photo])
  end
end
=======
>>>>>>> 36a507d4fbb98ee6618f9b9bcd1ffacc7f3feb68
