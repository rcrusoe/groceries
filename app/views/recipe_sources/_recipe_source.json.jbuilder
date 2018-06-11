json.extract! recipe_source, :id, :name, :link, :scrape_name, :scrape_ingredient, :scrape_image, :domain, :created_at, :updated_at
json.url recipe_source_url(recipe_source, format: :json)
