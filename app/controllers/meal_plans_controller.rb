class MealPlansController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @meal_plan = @recipe.meal_plans.create(params[:meal_plan].permit(:recipe_id, :user_id, :status))

    redirect_to @recipe
  end

  def archive
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.update_column(:status, "Complete")

    respond_to do |format|
      if @meal_plan.save
        format.html { redirect_to "/groceries", notice: 'Recipe was successfully removed.' }
      else
        format.html { redirect_to "/groceries", notice: 'Something went wrong.' }
      end
    end
  end
end
