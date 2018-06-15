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
              byebug
              link = source.link + link
            end
            Recipe.where(recipe_source_id: source.id, link: link).first_or_create.update(link: link)
          end
        end
      end
    end
  end
end
