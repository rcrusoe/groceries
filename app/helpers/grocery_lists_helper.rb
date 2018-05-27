module GroceryListsHelper
  def current_recipes_on_list
    if current_user
      @meal_plans = MealPlan.where(user_id: current_user["uid"], status: "Upcoming")
      @recipes = []
      @meal_plans.each do |meal_plan|
        @recipes.push(Recipe.find(meal_plan.recipe_id))
      end
    end
  end

  def ingredient_count
    if current_user
      current_recipes_on_list
      @ingredient_count = 0
      @recipes.each do |recipe|
        @ingredient_count += recipe.ingredients.count
      end
    end
  end

  def is_current_recipe_on_list
    if MealPlan.where(recipe_id: params[:id], status: "Upcoming").count > 0
      @already_added = true;
    end
  end
end
