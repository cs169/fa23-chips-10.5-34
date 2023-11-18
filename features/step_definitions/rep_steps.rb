
Given /the following representatives exist/ do |reps_list| 
  reps_list.raw.each do |rep|
    Representative.create(name: rep, news_items: [])
  end
end

Given /"(.*)" has the following news articles/ do |rep_name|
  rep = Representative.find(name: rep_name)
  articles.hashes.each do |article|
    updated_articles = rep.news_items.append({title: article[:title], description: article[:description], link: article[:link]})
    rep.update(news_items: updated_articles)
  end
end

