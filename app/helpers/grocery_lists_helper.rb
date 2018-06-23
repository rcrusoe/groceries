module GroceryListsHelper
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
    # get all recipes on list
    @recipes = Recipe.joins(:meal_plans).where(meal_plans: {user_id: current_user["uid"], status: "Upcoming"})

    # get all ingredients from all recipes on list
    @ingreds = Ingredient.where('recipe_id IN (?)', @recipes.select { |r| r.id })

    # group ingredients by grocery item
    @grocery_item_grouping = @ingreds.group_by{ |i| i.grocery_item }

    # group ingredients by recipes
    @recipe_grouping = @ingreds.group_by{ |i| i.recipe }
  end
end
