RecipeSource.create!([
  {name: "Half Baked Harvest", link: "http://halfbakedharvest.com", scrape_name: "h1.post-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".post-content img", domain: "halfbakedharvest.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "All Recipes", link: "http://allrecipes.com", scrape_name: ".recipe-summary__h1", scrape_ingredient: ".recipe-ingred_txt", scrape_image: ".rec-photo", domain: "allrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Epicurious", link: "http://epicurious.com", scrape_name: "h1", scrape_ingredient: ".ingredient-item", scrape_image: "picture", domain: "epicurious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Delish", link: "http://delish.com", scrape_name: "h1.content-hed.recipe-hed", scrape_ingredient: ".ingredient-item", scrape_image: "img", domain: "delish.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "My Recipes", link: "http://myrecipes.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: "", domain: "myrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Genius Kitchen", link: "http://geniuskitchen.com", scrape_name: ".recipe-header h1", scrape_ingredient: ".ingredient-list li", scrape_image: "", domain: "geniuskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Tasty", link: "http://tasty.co", scrape_name: "h1.recipe-name", scrape_ingredient: ".ingredients__section li", scrape_image: "", domain: "tasty.co", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Pioneer Woman", link: "http://thepioneerwoman.com", scrape_name: "h2.entry-title", scrape_ingredient: ".list-ingredients li", scrape_image: ".featured-image img", domain: "thepioneerwoman.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Kitchn", link: "http://thekitchn.com", scrape_name: "h1.PostHeader__headline", scrape_ingredient: ".PostRecipeIngredientGroup__ingredient", scrape_image: ".PostPicture__picture img", domain: "thekitchn.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Food Network", link: "http://foodnetwork.com", scrape_name: "h1.o-AssetTitle__a-Headline", scrape_ingredient: ".o-Ingredients__a-ListItemText", scrape_image: "", domain: "foodnetwork.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Food 52", link: "http://food52.com", scrape_name: "h1.article-header-title", scrape_ingredient: ".recipe-list li", scrape_image: "#recipe-gallery-frame img", domain: "food52.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "yummly", link: "http://yummly.com", scrape_name: ".primary-info-text h1", scrape_ingredient: ".IngredientLine", scrape_image: "", domain: "yummly.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "ChowHound", link: "http://chowhound.com", scrape_name: "h1", scrape_ingredient: "li[itemprop=\"ingredients]", scrape_image: "", domain: "chowhound.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Simply Recipes", link: "http://simplyrecipes.com", scrape_name: "h1.entry-title", scrape_ingredient: "li.ingredient", scrape_image: ".featured-image img", domain: "simplyrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Cooking Light", link: "http://cookinglight.com", scrape_name: "h1.headline", scrape_ingredient: ".ingredients li", scrape_image: ".image-container img", domain: "cookinglight.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Betty Crocker", link: "http://bettycrocker.com", scrape_name: ".recipePartTitle h1", scrape_ingredient: ".recipePartIngredient", scrape_image: ".recipePartRecipeImage img", domain: "bettycrocker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Eating Well", link: "http://eatingwell.com", scrape_name: ".recipeDetailSummaryDetails h3.recipeDetailHeader", scrape_ingredient: "span[itemprop=\"ingredients\"]", scrape_image: "img.recipeDetailSummaryImageMain", domain: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Cooks", link: "http://cooks.com", scrape_name: ".title", scrape_ingredient: ".ingredient", scrape_image: "", domain: "cooks.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Kraft Recipes", link: "http://kraftrecipes.com", scrape_name: "h1#khMainTitle", scrape_ingredient: "span[itemprop=\"recipeIngredient\"]", scrape_image: "", domain: "kraftrecipes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Serious Eats", link: "http://seriouseats.com", scrape_name: "h1.recipe-title", scrape_ingredient: ".ingredient", scrape_image: ".recipe-main-photo img", domain: "seriouseats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Low Carb Yum", link: "http://lowcarbyum.com", scrape_name: ".entry-header h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "lowcarbyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "iFoodReal", link: "http://ifoodreal.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ifoodreal-recipe-ingredients li", scrape_image: ".entry-content img", domain: "ifoodreal.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Ambitious Kitchen", link: "http://ambitiouskitchen.com", scrape_name: "h1.entry-title", scrape_ingredient: ".ERSIngredients li", scrape_image: ".entry_content p img", domain: "ambitiouskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Dinner at the Zoo", link: "http://dinneratthezoo.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p img", domain: "dinneratthezoo.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Damn Delicious", link: "http://damndelicious.net", scrape_name: ".post-title h1", scrape_ingredient: ".ingredient", scrape_image: ".post p img", domain: "damndelicious.net", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Eazy Peazy Mealz", link: "https://www.eazypeazymealz.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", domain: "eazypeazymealz.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "No. 2 Pencil", link: "https://www.number-2-pencil.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "number-2-pencil.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Life Made Sweeter", link: "https://lifemadesweeter.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", domain: "lifemadesweeter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Cooking Classy", link: "https://www.cookingclassy.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".content img.size-full", domain: "cookingclassy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Gimme Delicious", link: "https://gimmedelicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.size-full", domain: "gimmedelicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Yummy Healthy Easy", link: "https://www.yummyhealthyeasy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img.size-full", domain: "yummyhealthyeasy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Eat Yourself Skinny", link: "http://www.eatyourselfskinny.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: ".post-content img", domain: "eatyourselfskinny.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Budget Bytes", link: "https://www.budgetbytes.com/", scrape_name: "h1.title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: "#content img", domain: "budgetbytes.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Crunchy Creamy Sweet", link: "https://www.crunchycreamysweet.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "crunchycreamysweet.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Iowa Girl Eats", link: "https://iowagirleats.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".recipe-ingredients li", scrape_image: ".entry-content img.size-full", domain: "iowagirleats.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Pinch of Yum", link: "https://pinchofyum.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", domain: "pinchofyum.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Chelsea's Messy Apron", link: "https://www.chelseasmessyapron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img.aligncenter", domain: "chelseasmessyapron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Little Spice Jar", link: "http://littlespicejar.com/", scrape_name: "h1.title", scrape_ingredient: ".ingredients li", scrape_image: ".post img", domain: "littlespicejar.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Healing Tomato", link: "https://www.healingtomato.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "healingtomato.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Fitchen", link: "http://thefitchen.com/", scrape_name: "h1.post-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".post_content img.size-full", domain: "thefitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Abra's Kitchen", link: "https://abraskitchen.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "abraskitchen.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Green Healthy Cooking", link: "https://greenhealthycooking.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "greenhealthycooking.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Cotter Crunch", link: "https://www.cottercrunch.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", domain: "cottercrunch.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Girl on Bloor", link: "http://thegirlonbloor.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-recipe-ingredient", scrape_image: ".entry-content p img", domain: "thegirlonbloor.com", recipe_index_link: "https://thegirlonbloor.com/category/recipes-food-2/", category_css: "", recipe_css: ".content article a", multiple_pages: true},
  {name: "Love Leaf", link: "https://loveleafco.com/", scrape_name: "h1.BlogItem-title", scrape_ingredient: ".sqs-block-content ul li", scrape_image: ".Main-content img", domain: "loveleafco.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Skinny Fitalicious", link: "https://skinnyfitalicious.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "skinnyfitalicious.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Wholefully", link: "https://wholefully.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", domain: "wholefully.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Let There Be Butter", link: "https://lettherebebutter.com/", scrape_name: "h1.entry-title", scrape_ingredient: "ul:nth-of-type(2) li", scrape_image: ".entry-content img", domain: "lettherebebutter.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Meal Prep on Fleek", link: "https://mealpreponfleek.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wpurp-recipe-ingredient", scrape_image: ".entry-content img", domain: "mealpreponfleek.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Peace Love and Low Carb", link: "https://peaceloveandlowcarb.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content img", domain: "peaceloveandlowcarb.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Meal Prep Mondays", link: "http://www.mealprepmondays.com/", scrape_name: "h2.article-title", scrape_ingredient: ".ingredient", scrape_image: ".post-text img", domain: "mealprepmondays.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Aimee Mars", link: "http://www.aimeemars.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipe-ingredients li", scrape_image: ".entry-content img", domain: "aimeemars.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Carmy", link: "https://carmyy.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "carmyy.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Project Meal Plan", link: "https://projectmealplan.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".tasty-recipes-ingredients li", scrape_image: ".entry-content p img", domain: "projectmealplan.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Food Girl", link: "http://www.thefoodgirl.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content img", domain: "thefoodgirl.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Sweet Peas and Saffron", link: "https://sweetpeasandsaffron.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "sweetpeasandsaffron.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "A Sweet Pea Chef", link: "https://www.asweetpeachef.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content p:not(:nth-of-type(2)) img", domain: "asweetpeachef.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Bon Appetit", link: "https://www.bonappetit.com/", scrape_name: "h1", scrape_ingredient: ".ingredient", scrape_image: "picture img", domain: "bonappetit.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Minimalist Baker", link: "http://minimalistbaker.com", scrape_name: "h1.entry-title", scrape_ingredient: ".wprm-recipe-ingredient", scrape_image: ".entry-content img", domain: "minimalistbaker.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Health", link: "http://www.health.com/", scrape_name: "h1", scrape_ingredient: ".ingredients li", scrape_image: ".recipe-content img", domain: "health.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Skinny Taste", link: "https://www.skinnytaste.com/", scrape_name: "#content h1", scrape_ingredient: ".ingredient", scrape_image: "#content img", domain: "skinnytaste.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Martha Stewart", link: "https://www.marthastewart.com/", scrape_name: "h1.page-title", scrape_ingredient: ".components-item label", scrape_image: ".hero-image img", domain: "marthastewart.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Eating Well", link: "http://www.eatingwell.com/", scrape_name: "h3.recipeDetailHeader", scrape_ingredient: ".listIngredients li", scrape_image: ".recipeDetailSummaryImageContainer img", domain: "eatingwell.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Dinner Then Dessert", link: "https://dinnerthendessert.com/", scrape_name: "h1.post-title", scrape_ingredient: ".ingredient", scrape_image: "#content p img", domain: "dinnerthendessert.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "The Recipe Critic", link: "https://therecipecritic.com/", scrape_name: "h1.entry-title", scrape_ingredient: ".ingredient", scrape_image: ".entry-content p img", domain: "therecipecritic.com", recipe_index_link: nil, category_css: nil, recipe_css: nil, multiple_pages: nil},
  {name: "Smitten Kitchen", link: "http://smittenkitchen.com", scrape_name: "h1.entry-title > a", scrape_ingredient: ".jetpack-recipe-ingredient", scrape_image: ".post-thumbnail-container > img", domain: "smittenkitchen.com", recipe_index_link: "https://smittenkitchen.com/recipes/", category_css: ".smittenkitchen-recipe-listing li a", recipe_css: "#main > li a", multiple_pages: false}
])
