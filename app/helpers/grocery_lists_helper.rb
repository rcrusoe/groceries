module GroceryListsHelper
  def current_recipes_on_list
    if current_user
      @meal_plans = MealPlan.where(user_id: current_user["uid"], status: "Upcoming")
      @meals = []
      @meal_plans.each do |meal_plan|
        meal = {meal_plan: meal_plan}
        meal[:recipe] = Recipe.find(meal_plan.recipe_id)
        @meals.push(meal)
      end
    end
  end

  def is_current_recipe_on_list
    if current_user
      if MealPlan.where(recipe_id: params[:id], status: "Upcoming", user_id: current_user["uid"]).count > 0
        @already_added = true;
      end
    end
  end
end
