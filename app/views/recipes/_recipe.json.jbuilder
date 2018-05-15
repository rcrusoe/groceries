json.extract! recipe, :id, :name, :link, :ingredients, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
