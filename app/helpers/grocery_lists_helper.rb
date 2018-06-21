module GroceryListsHelper
  def current_recipes_on_list
    if current_user
      @meal_plans = MealPlan.where(user_id: current_user["uid"], status: "Upcoming")
    end
  end

  def is_current_recipe_on_list
    if current_user
      @recipe = Recipe.friendly.find(params[:id])
      if MealPlan.where(recipe_id: @recipe.id, status: "Upcoming", user_id: current_user["uid"]).count > 0
        @meal_plan = MealPlan.where(recipe_id: @recipe.id, status: "Upcoming", user_id: current_user["uid"]).first
        @already_added = true;
      end
    end
  end

  def grocery_items_on_list
    @groceries = {}
    @meal_plans.each do |meal|
      meal.recipe.grocery_items.each do |grocery|
        unless @groceries.include?(grocery)
          ingreds = []
          grocery.ingredients.each do |i|
            if @meal_plans.include?(Recipe.find(i.recipe_id))
              ingreds.push(i)
            end
          end
          @groceries[grocery] = ingreds
        end
      end
    end
  end
end
