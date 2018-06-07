RecipeSource.create!([
  {name: "Half Baked Harvest", link: "http://halfbakedharvest.com", scrape_name: "h1.post-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".post-content img", slug: "halfbakedharvest.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Smitten Kitchen", link: "http://smittenkitchen.com", scrape_name: "h1.entry-title > a", scrape_ingredient: ".jetpack-recipe-ingredient", scrape_image: ".post-thumbnail-container > img", slug: "smittenkitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "All Recipes", link: "http://allrecipes.com", scrape_name: ".recipe-summary__h1", scrape_ingredient: ".recipe-ingred_txt", scrape_image: ".rec-photo", slug: "allrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Epicurious", link: "http://epicurious.com", scrape_name: "h1", scrape_ingredient: ".ingredient-item", scrape_image: "picture", slug: "epicurious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Delish", link: "http://delish.com", scrape_name: "h1.content-hed.recipe-hed", scrape_ingredient: ".ingredient-item", scrape_image: "img", slug: "delish.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "My Recipes", link: "http://myrecipes.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: "", slug: "myrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Genius Kitchen", link: "http://geniuskitchen.com", scrape_name: ".recipe-header h1", scrape_ingredient: ".ingredient-list li", scrape_image: "", slug: "geniuskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Tasty", link: "http://tasty.co", scrape_name: "h1.recipe-name", scrape_ingredient: ".ingredients__section li", scrape_image: "", slug: "tasty.co", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Pioneer Woman", link: "http://thepioneerwoman.com", scrape_name: "h2.entry-title", scrape_ingredient: ".list-ingredients li", scrape_image: ".featured-image img", slug: "thepioneerwoman.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Kitchn", link: "http://thekitchn.com", scrape_name: "h1.PostHeader__headline", scrape_ingredient: ".PostRecipeIngredientGroup__ingredient", scrape_image: ".PostPicture__picture img", slug: "thekitchn.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Food Network", link: "http://foodnetwork.com", scrape_name: "h1.o-AssetTitle__a-Headline", scrape_ingredient: ".o-Ingredients__a-ListItemText", scrape_image: "", slug: "foodnetwork.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Food 52", link: "http://food52.com", scrape_name: "h1.article-header-title", scrape_ingredient: ".recipe-list li", scrape_image: "#recipe-gallery-frame img", slug: "food52.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "yummly", link: "http://yummly.com", scrape_name: ".primary-info-text h1", scrape_ingredient: ".IngredientLine", scrape_image: "", slug: "yummly.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "ChowHound", link: "http://chowhound.com", scrape_name: "h1", scrape_ingredient: "li[itemprop=\"ingredients]", scrape_image: "", slug: "chowhound.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Simply Recipes", link: "http://simplyrecipes.com", scrape_name: "h1.entry-title", scrape_ingredient: "li.ingredient", scrape_image: ".featured-image img", slug: "simplyrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooking Light", link: "http://cookinglight.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: ".image-container img", slug: "cookinglight.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Betty Crocker", link: "http://bettycrocker.com", scrape_name: ".recipePartTitle h1", scrape_ingredient: ".recipePartIngredient", scrape_image: ".recipePartRecipeImage img", slug: "bettycrocker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eating Well", link: "http://eatingwell.com", scrape_name: ".recipeDetailSummaryDetails h3.recipeDetailHeader", scrape_ingredient: "span[itemprop=\"ingredients\"]", scrape_image: "img.recipeDetailSummaryImageMain", slug: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooks", link: "http://cooks.com", scrape_name: ".title", scrape_ingredient: ".ingredient", scrape_image: "", slug: "cooks.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Kraft Recipes", link: "http://kraftrecipes.com", scrape_name: "h1#khMainTitle", scrape_ingredient: "span[itemprop=\"recipeIngredient\"]", scrape_image: "", slug: "kraftrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Serious Eats", link: "http://seriouseats.com", scrape_name: "h1.recipe-title", scrape_ingredient: ".ingredient", scrape_image: ".recipe-main-photo img", slug: "seriouseats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Low Carb Yum", link: "http://lowcarbyum.com", scrape_name: ".entry-header h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "lowcarbyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "iFoodReal", link: "http://ifoodreal.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ifoodreal-recipe-ingredients li", scrape_image: ".entry-content img", slug: "ifoodreal.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Ambitious Kitchen", link: "http://ambitiouskitchen.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ERSIngredients li", scrape_image: ".entry_content p img", slug: "ambitiouskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Dinner at the Zoo", link: "http://dinneratthezoo.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p img", slug: "dinneratthezoo.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Damn Delicious", link: "http://damndelicious.net", scrape_name: ".post-title h1", scrape_ingredient: ".ingredient", scrape_image: ".post p img", slug: "damndelicious.net", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Girl on Bloor", link: "http://thegirlonbloor.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-responsive-desktop .wpurp-recipe-ingredient-container .wpurp-recipe-ingredient", scrape_image: ".entry-content p img", slug: "thegirlonbloor.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eazy Peazy Mealz", link: "https://www.eazypeazymealz.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", slug: "eazypeazymealz.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "No. 2 Pencil", link: "https://www.number-2-pencil.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "number-2-pencil.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Life Made Sweeter", link: "https://lifemadesweeter.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", slug: "lifemadesweeter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooking Classy", link: "https://www.cookingclassy.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".content img.size-full", slug: "cookingclassy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Gimme Delicious", link: "https://gimmedelicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", slug: "gimmedelicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Yummy Healthy Easy", link: "https://www.yummyhealthyeasy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img.size-full", slug: "yummyhealthyeasy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eat Yourself Skinny", link: "http://www.eatyourselfskinny.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: ".post-content img", slug: "eatyourselfskinny.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Budget Bytes", link: "https://www.budgetbytes.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: "#content img", slug: "budgetbytes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Crunchy Creamy Sweet", link: "https://www.crunchycreamysweet.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "crunchycreamysweet.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Iowa Girl Eats", link: "https://iowagirleats.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".recipe-ingredients li", scrape_image: ".entry-content img.size-full", slug: "iowagirleats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Pinch of Yum", link: "https://pinchofyum.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "pinchofyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Chelsea's Messy Apron", link: "https://www.chelseasmessyapron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.aligncenter", slug: "chelseasmessyapron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Little Spice Jar", link: "http://littlespicejar.com/", scrape_name: "h1.title", scrape_ingredient: ".ingredients li", scrape_image: ".post img", slug: "littlespicejar.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Healing Tomato", link: "https://www.healingtomato.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "healingtomato.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Fitchen", link: "http://thefitchen.com/", scrape_name: "h1.post-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".post_content img.size-full", slug: "thefitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Abra's Kitchen", link: "https://abraskitchen.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "abraskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Green Healthy Cooking", link: "https://greenhealthycooking.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "greenhealthycooking.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cotter Crunch", link: "https://www.cottercrunch.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "cottercrunch.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Love Leaf", link: "https://loveleafco.com/", scrape_name: "h1.BlogItem-title", scrape_ingredient: ".sqs-block-content ul li", scrape_image: ".Main-content img", slug: "loveleafco.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Skinny Fitalicious", link: "https://skinnyfitalicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "skinnyfitalicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Wholefully", link: "https://wholefully.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "wholefully.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Let There Be Butter", link: "https://lettherebebutter.com/", scrape_name: "h1.entry-title", scrape_ingredient: "ul:nth-of-type(2) li", scrape_image: ".entry-content img", slug: "lettherebebutter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Meal Prep on Fleek", link: "https://mealpreponfleek.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-recipe-ingredient", scrape_image: ".entry-content img", slug: "mealpreponfleek.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Peace Love and Low Carb", link: "https://peaceloveandlowcarb.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "peaceloveandlowcarb.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Meal Prep Mondays", link: "http://www.mealprepmondays.com/", scrape_name: "h2.article-title", scrape_ingredient: ".ingredient", scrape_image: ".post-text img", slug: "mealprepmondays.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Aimee Mars", link: "http://www.aimeemars.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".entry-content img", slug: "aimeemars.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Carmy", link: "https://carmyy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "carmyy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Project Meal Plan", link: "https://projectmealplan.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content p img", slug: "projectmealplan.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Food Girl", link: "http://www.thefoodgirl.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", slug: "thefoodgirl.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Sweet Peas and Saffron", link: "https://sweetpeasandsaffron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "sweetpeasandsaffron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "A Sweet Pea Chef", link: "https://www.asweetpeachef.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p:not(:nth-of-type(2)) img", slug: "asweetpeachef.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Bon Appetit", link: "https://www.bonappetit.com/", scrape_name: "h1", scrape_ingredient: ".ingredient", scrape_image: "picture img", slug: "bonappetit.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Minimalist Baker", link: "http://minimalistbaker.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "minimalistbaker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Health", link: "http://www.health.com/", scrape_name: "h1", scrape_ingredient: ".ingredients li", scrape_image: ".recipe-content img", slug: "health.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Skinny Taste", link: "https://www.skinnytaste.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: "#content img", slug: "skinnytaste.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Martha Stewart", link: "https://www.marthastewart.com/", scrape_name: "h1.page-title", scrape_ingredient: ".components-item label", scrape_image: ".hero-image img", slug: "marthastewart.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eating Well", link: "http://www.eatingwell.com/", scrape_name: "h3.recipeDetailHeader", scrape_ingredient: ".listIngredients li", scrape_image: ".recipeDetailSummaryImageContainer img", slug: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Dinner Then Dessert", link: "https://dinnerthendessert.com/", scrape_name: "h1.post-title", scrape_ingredient: ".ingredient", scrape_image: "#content p img", slug: "dinnerthendessert.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Recipe Critic", link: "https://therecipecritic.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content p img", slug: "therecipecritic.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Half Baked Harvest", link: "http://halfbakedharvest.com", scrape_name: "h1.post-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".post-content img", slug: "halfbakedharvest.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "All Recipes", link: "http://allrecipes.com", scrape_name: ".recipe-summary__h1", scrape_ingredient: ".recipe-ingred_txt", scrape_image: ".rec-photo", slug: "allrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Epicurious", link: "http://epicurious.com", scrape_name: "h1", scrape_ingredient: ".ingredient-item", scrape_image: "picture", slug: "epicurious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Delish", link: "http://delish.com", scrape_name: "h1.content-hed.recipe-hed", scrape_ingredient: ".ingredient-item", scrape_image: "img", slug: "delish.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "My Recipes", link: "http://myrecipes.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: "", slug: "myrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Genius Kitchen", link: "http://geniuskitchen.com", scrape_name: ".recipe-header h1", scrape_ingredient: ".ingredient-list li", scrape_image: "", slug: "geniuskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Tasty", link: "http://tasty.co", scrape_name: "h1.recipe-name", scrape_ingredient: ".ingredients__section li", scrape_image: "", slug: "tasty.co", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Pioneer Woman", link: "http://thepioneerwoman.com", scrape_name: "h2.entry-title", scrape_ingredient: ".list-ingredients li", scrape_image: ".featured-image img", slug: "thepioneerwoman.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Kitchn", link: "http://thekitchn.com", scrape_name: "h1.PostHeader__headline", scrape_ingredient: ".PostRecipeIngredientGroup__ingredient", scrape_image: ".PostPicture__picture img", slug: "thekitchn.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Food Network", link: "http://foodnetwork.com", scrape_name: "h1.o-AssetTitle__a-Headline", scrape_ingredient: ".o-Ingredients__a-ListItemText", scrape_image: "", slug: "foodnetwork.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Food 52", link: "http://food52.com", scrape_name: "h1.article-header-title", scrape_ingredient: ".recipe-list li", scrape_image: "#recipe-gallery-frame img", slug: "food52.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "yummly", link: "http://yummly.com", scrape_name: ".primary-info-text h1", scrape_ingredient: ".IngredientLine", scrape_image: "", slug: "yummly.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "ChowHound", link: "http://chowhound.com", scrape_name: "h1", scrape_ingredient: "li[itemprop=\"ingredients]", scrape_image: "", slug: "chowhound.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Simply Recipes", link: "http://simplyrecipes.com", scrape_name: "h1.entry-title", scrape_ingredient: "li.ingredient", scrape_image: ".featured-image img", slug: "simplyrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooking Light", link: "http://cookinglight.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: ".image-container img", slug: "cookinglight.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Betty Crocker", link: "http://bettycrocker.com", scrape_name: ".recipePartTitle h1", scrape_ingredient: ".recipePartIngredient", scrape_image: ".recipePartRecipeImage img", slug: "bettycrocker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eating Well", link: "http://eatingwell.com", scrape_name: ".recipeDetailSummaryDetails h3.recipeDetailHeader", scrape_ingredient: "span[itemprop=\"ingredients\"]", scrape_image: "img.recipeDetailSummaryImageMain", slug: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooks", link: "http://cooks.com", scrape_name: ".title", scrape_ingredient: ".ingredient", scrape_image: "", slug: "cooks.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Kraft Recipes", link: "http://kraftrecipes.com", scrape_name: "h1#khMainTitle", scrape_ingredient: "span[itemprop=\"recipeIngredient\"]", scrape_image: "", slug: "kraftrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Serious Eats", link: "http://seriouseats.com", scrape_name: "h1.recipe-title", scrape_ingredient: ".ingredient", scrape_image: ".recipe-main-photo img", slug: "seriouseats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Low Carb Yum", link: "http://lowcarbyum.com", scrape_name: ".entry-header h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "lowcarbyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "iFoodReal", link: "http://ifoodreal.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ifoodreal-recipe-ingredients li", scrape_image: ".entry-content img", slug: "ifoodreal.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Ambitious Kitchen", link: "http://ambitiouskitchen.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ERSIngredients li", scrape_image: ".entry_content p img", slug: "ambitiouskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Dinner at the Zoo", link: "http://dinneratthezoo.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p img", slug: "dinneratthezoo.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Damn Delicious", link: "http://damndelicious.net", scrape_name: ".post-title h1", scrape_ingredient: ".ingredient", scrape_image: ".post p img", slug: "damndelicious.net", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Girl on Bloor", link: "http://thegirlonbloor.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-responsive-desktop .wpurp-recipe-ingredient-container .wpurp-recipe-ingredient", scrape_image: ".entry-content p img", slug: "thegirlonbloor.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eazy Peazy Mealz", link: "https://www.eazypeazymealz.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", slug: "eazypeazymealz.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "No. 2 Pencil", link: "https://www.number-2-pencil.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "number-2-pencil.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Life Made Sweeter", link: "https://lifemadesweeter.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", slug: "lifemadesweeter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cooking Classy", link: "https://www.cookingclassy.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".content img.size-full", slug: "cookingclassy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Gimme Delicious", link: "https://gimmedelicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", slug: "gimmedelicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Yummy Healthy Easy", link: "https://www.yummyhealthyeasy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img.size-full", slug: "yummyhealthyeasy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eat Yourself Skinny", link: "http://www.eatyourselfskinny.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: ".post-content img", slug: "eatyourselfskinny.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Budget Bytes", link: "https://www.budgetbytes.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: "#content img", slug: "budgetbytes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Crunchy Creamy Sweet", link: "https://www.crunchycreamysweet.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "crunchycreamysweet.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Iowa Girl Eats", link: "https://iowagirleats.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".recipe-ingredients li", scrape_image: ".entry-content img.size-full", slug: "iowagirleats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Pinch of Yum", link: "https://pinchofyum.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "pinchofyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Chelsea's Messy Apron", link: "https://www.chelseasmessyapron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.aligncenter", slug: "chelseasmessyapron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Little Spice Jar", link: "http://littlespicejar.com/", scrape_name: "h1.title", scrape_ingredient: ".ingredients li", scrape_image: ".post img", slug: "littlespicejar.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Healing Tomato", link: "https://www.healingtomato.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "healingtomato.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Fitchen", link: "http://thefitchen.com/", scrape_name: "h1.post-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".post_content img.size-full", slug: "thefitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Abra's Kitchen", link: "https://abraskitchen.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "abraskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Green Healthy Cooking", link: "https://greenhealthycooking.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "greenhealthycooking.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Cotter Crunch", link: "https://www.cottercrunch.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "cottercrunch.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Love Leaf", link: "https://loveleafco.com/", scrape_name: "h1.BlogItem-title", scrape_ingredient: ".sqs-block-content ul li", scrape_image: ".Main-content img", slug: "loveleafco.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Skinny Fitalicious", link: "https://skinnyfitalicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "skinnyfitalicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Wholefully", link: "https://wholefully.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "wholefully.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Let There Be Butter", link: "https://lettherebebutter.com/", scrape_name: "h1.entry-title", scrape_ingredient: "ul:nth-of-type(2) li", scrape_image: ".entry-content img", slug: "lettherebebutter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Meal Prep on Fleek", link: "https://mealpreponfleek.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-recipe-ingredient", scrape_image: ".entry-content img", slug: "mealpreponfleek.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Peace Love and Low Carb", link: "https://peaceloveandlowcarb.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", slug: "peaceloveandlowcarb.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Meal Prep Mondays", link: "http://www.mealprepmondays.com/", scrape_name: "h2.article-title", scrape_ingredient: ".ingredient", scrape_image: ".post-text img", slug: "mealprepmondays.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Aimee Mars", link: "http://www.aimeemars.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".entry-content img", slug: "aimeemars.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Carmy", link: "https://carmyy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "carmyy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Project Meal Plan", link: "https://projectmealplan.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content p img", slug: "projectmealplan.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Food Girl", link: "http://www.thefoodgirl.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", slug: "thefoodgirl.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Sweet Peas and Saffron", link: "https://sweetpeasandsaffron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "sweetpeasandsaffron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "A Sweet Pea Chef", link: "https://www.asweetpeachef.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p:not(:nth-of-type(2)) img", slug: "asweetpeachef.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Bon Appetit", link: "https://www.bonappetit.com/", scrape_name: "h1", scrape_ingredient: ".ingredient", scrape_image: "picture img", slug: "bonappetit.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Minimalist Baker", link: "http://minimalistbaker.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", slug: "minimalistbaker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Health", link: "http://www.health.com/", scrape_name: "h1", scrape_ingredient: ".ingredients li", scrape_image: ".recipe-content img", slug: "health.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Skinny Taste", link: "https://www.skinnytaste.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: "#content img", slug: "skinnytaste.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Martha Stewart", link: "https://www.marthastewart.com/", scrape_name: "h1.page-title", scrape_ingredient: ".components-item label", scrape_image: ".hero-image img", slug: "marthastewart.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Eating Well", link: "http://www.eatingwell.com/", scrape_name: "h3.recipeDetailHeader", scrape_ingredient: ".listIngredients li", scrape_image: ".recipeDetailSummaryImageContainer img", slug: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Dinner Then Dessert", link: "https://dinnerthendessert.com/", scrape_name: "h1.post-title", scrape_ingredient: ".ingredient", scrape_image: "#content p img", slug: "dinnerthendessert.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "The Recipe Critic", link: "https://therecipecritic.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content p img", slug: "therecipecritic.com", recipe_index_link: nil, category_css: nil, recipe_css: nil},
  {name: "Smitten Kitchen", link: "http://smittenkitchen.com", scrape_name: "h1.entry-title > a", scrape_ingredient: ".jetpack-recipe-ingredient", scrape_image: ".post-thumbnail-container > img", slug: "smittenkitchen.com", recipe_index_link: "https://smittenkitchen.com/recipes/", category_css: ".smittenkitchen-recipe-listing li a", recipe_css: "#main > li a"}
])
