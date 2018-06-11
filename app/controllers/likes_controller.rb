class LikesController < ApplicationController
  def create
    @recipe = Recipe.friendly.find(params[:recipe_id])
    @like = @recipe.likes.create(params[:like].permit(:recipe_id, :user_id))
    redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe)
  end

  def destroy
    @like = Like.find(params[:id])
    @recipe = Recipe.friendly.find(@like.recipe_id)
    @like.destroy
    redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe)
  end
end
