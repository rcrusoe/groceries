namespace :scrape_recipes do
  desc "Goes to each recipe source and looks for new recipes"
  task scrape_all_recipes: :environment do
    @recipe_sources = RecipeSource.all
    @recipe_sources.each do |source|
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
                  Recipe.where(recipe_source_id: source.id, link: link).first_or_create
                end
              end
            else
              links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
              links.each do |link|
                Recipe.where(recipe_source_id: source.id, link: link).first_or_create
              end
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
                Recipe.where(recipe_source_id: source.id, link: link).first_or_create
              end
            end
          else
            links = @doc.css(source.recipe_css).map { |link| link['href'] } || []
            links.each do |link|
              Recipe.where(recipe_source_id: source.id, link: link).first_or_create
            end
          end
        end
      end
    end
  end
end
