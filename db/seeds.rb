recipe_source_list = [
  [ "The Minimalist Baker", "http://minimalistbaker.com", "h1.entry-title", ".entry-content img", ".ingredient" ],
  [ "Half Baked Harvest", "http://halfbakedharvest.com", "h1.post-title", ".post-content img", ".wprm-recipe-ingredient" ],
  [ "Smitten Kitchen", "http://smittenkitchen.com", "h1.entry-title > a", ".post-thumbnail-container > img", ".jetpack-recipe-ingredient" ],
  [ "All Recipes", "http://allrecipes.com", ".recipe-summary__h1", ".rec-photo", ".recipe-ingred_txt" ],
  [ "Epicurious", "http://epicurious.com", "h1", "picture", ".ingredient-item" ],
  [ "Delish", "http://delish.com", "h1.content-hed.recipe-hed", "img", ".ingredient-item" ],
  [ "My Recipes", "http://myrecipes.com", "h1.headline", "", ".ingredients li" ],
  [ "Genius Kitchen", "http://geniuskitchen.com", ".recipe-header h1", "", ".ingredient-list li" ],
  [ "Tasty", "http://tasty.co", "h1.recipe-name", "", ".ingredients__section li" ],
  [ "The Pioneer Woman", "http://thepioneerwoman.com", "h2.entry-title", ".featured-image img", ".list-ingredients li" ],
  [ "The Kitchn", "http://thekitchn.com", "h1.PostHeader__headline", ".PostPicture__picture img", ".PostRecipeIngredientGroup__ingredient" ],
  [ "Food Network", "http://foodnetwork.com", "h1.o-AssetTitle__a-Headline", "", ".o-Ingredients__a-ListItemText" ],
  [ "Food 52", "http://food52.com", "h1.article-header-title", "#recipe-gallery-frame img", ".recipe-list li" ],
  [ "yummly", "http://yummly.com", ".primary-info-text h1", "", ".IngredientLine" ],
  [ "ChowHound", "http://chowhound.com", "h1", "", 'li[itemprop="ingredients]' ],
  [ "Simply Recipes", "http://simplyrecipes.com", "h1.entry-title", ".featured-image img", "li.ingredient" ],
  [ "Cooking Light", "http://cookinglight.com", "h1.headline", ".image-container img", ".ingredients li" ],
  [ "Betty Crocker", "http://bettycrocker.com", ".recipePartTitle h1", ".recipePartRecipeImage img", ".recipePartIngredient" ],
  [ "Eating Well", "http://eatingwell.com", ".recipeDetailSummaryDetails h3.recipeDetailHeader", "img.recipeDetailSummaryImageMain", 'span[itemprop="ingredients"]' ],
  [ "Cooks", "http://cooks.com", ".title", "", ".ingredient" ],
  [ "Kraft Recipes", "http://kraftrecipes.com", "h1#khMainTitle", "", 'span[itemprop="recipeIngredient"]' ],
  [ "Serious Eats", "http://seriouseats.com", "h1.recipe-title", ".recipe-main-photo img", ".ingredient" ],
  [ "Low Carb Yum", "http://lowcarbyum.com", ".entry-header h1.entry-title", ".entry-content img", ".wprm-recipe-ingredient" ],
  [ "iFoodReal", "http://ifoodreal.com", "h1.entry-title", ".entry-content img", ".ifoodreal-recipe-ingredients li" ],
  [ "Ambitious Kitchen", "http://ambitiouskitchen.com", "h1.entry-title", ".entry_content p img", ".ERSIngredients li" ],
  [ "Dinner at the Zoo", "http://dinneratthezoo.com", "h1.entry-title", ".entry-content p img", ".wprm-recipe-ingredient" ],
  [ "Damn Delicious", "http://damndelicious.net", ".post-title h1", ".post p img", ".ingredient" ],
  [ "The Girl on Bloor", "http://thegirlonbloor.com", "h1.entry-title", ".entry-content p img", ".wpurp-responsive-desktop .wpurp-recipe-ingredient-container .wpurp-recipe-ingredient" ]
]

recipe_source_list.each do |name, link, scrape_name, scrape_image, scrape_ingredient|
  RecipeSource.create(name: name, link: link, scrape_name: scrape_name, scrape_image: scrape_image, scrape_ingredient: scrape_ingredient)
end
