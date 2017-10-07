json.articles do
  json.array!(@articles) do |article|
    json.name article.name
    json.url article_path(article)
  end
end

json.categories do
  json.array!(@categories) do |category|
    json.name category.name
    json.url category_path(category)
  end
end

json.tags do
  json.array!(@tags) do |tag|
    json.name tag.name
    json.url tag_path(tag)
  end
end
