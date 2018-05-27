class MealPlansController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @meal_plan = @recipe.meal_plans.create(params[:meal_plan].permit(:recipe_id, :user_id, :status))

    redirect_to @recipe
  end
end
