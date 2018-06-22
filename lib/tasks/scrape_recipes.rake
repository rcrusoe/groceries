namespace :scrape_recipes do
  desc "Goes to each recipe source and looks for new recipes"
  task :scrape_all_recipes, [:source_id] => [:environment] do |task, args|
    source = RecipeSource.find(args.source_id)
    if source.recipe_index_link
      require 'open-uri'
      index = source.recipe_index_link
      @doc = Nokogiri::HTML(open(index, 'User-Agent' => 'firefox'))
      unless source.category_css.blank?
        categories = @doc.css(source.category_css).map { |category| category['href'] } || []
        categories.each do |category|
          @doc = Nokogiri::HTML(open(category, 'User-Agent' => 'firefox'))
          if source.multiple_pages?
            page_number = 0
            links = ["www.mealprepday.co"]
            while links.length > 0 do
              page_number += 1
              page = category + "/page/" + page_number.to_s
              @doc = Nokogiri::HTML(open(page, 'User-Agent' => 'firefox'))
              links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
              links.each do |link|
                if link[0] == "/"
                  byebug
                  link = source.link + link
                end
                Recipe.where(recipe_source_id: source.id, link: link).first_or_create.update(link: link)
              end
              sleep(10)
            end
          else
            links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
            links.each do |link|
              if link[0] == "/"
                byebug
                link = source.link + link
              end
              Recipe.where(recipe_source_id: source.id, link: link).first_or_create.update(link: link)
            end
            sleep(10)
          end
        end
      else
        if source.multiple_pages?
          page_number = 0
          links = ["www.mealprepday.co"]
          while links.length > 0 do
            page_number += 1
            page = index + "page/" + page_number.to_s
            @doc = Nokogiri::HTML(open(page, 'User-Agent' => 'firefox'))
            links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
            links.each do |link|
              if link[0] == "/"
                link = source.link + link
              end
              Recipe.where(recipe_source_id: source.id, link: link).first_or_create.update(link: link)
            end
            sleep(10)
          end
        else
          links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
          links.each do |link|
            if link[0] == "/"
              link = source.link + link
            end
            Recipe.where(recipe_source_id: source.id, link: link).first_or_create.update(link: link)
          end
        end
      end
    end
  end

  desc "Creates ingredients from the recipe ingredients_array"
  task :create_ingredients_from_array do |task, args|
    require "google/cloud/language"
    Recipe.all.each do |r|
      r.ingredients_array.each do |ingredient|
        language = Google::Cloud::Language.new
        response = language.analyze_entities content: ingredient, type: :PLAIN_TEXT
        entities = response.entities
        blacklist = ["cup", "teaspoon", "pinch", "tablespoon"]
        grocery_item_name = nil
        unless entities.blank?
          entities.each do |e|
            grocery_item_name = e.name unless blacklist.include?(e.name.downcase)
          end
        end
        unless grocery_item_name.blank?
          grocery_item = GroceryItem.where(name: grocery_item_name).first_or_create(name: grocery_item_name)
        else
          grocery_item = GroceryItem.where(name: "Unassigned").first_or_create(name: "Unassigned")
        end
        ing = Ingredient.where(recipe_id: r.id, note: ingredient).first_or_create(recipe_id: r.id, grocery_item_id: grocery_item.id, note: ingredient)
      end
    end
  end
end
