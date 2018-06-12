module GroceryListsHelper
  def current_recipes_on_list
    if current_user
      @meal_plans = MealPlan.where(user_id: current_user["uid"], status: "Upcoming")
      @meals = []
      @meal_plans.each do |meal_plan|
        meal = {meal_plan: meal_plan}
        meal[:recipe] = Recipe.friendly.find(meal_plan.recipe_id)
        @meals.push(meal)
      end
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
end
