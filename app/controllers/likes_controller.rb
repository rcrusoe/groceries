class LikesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @like = @recipe.likes.create(params[:like].permit(:recipe_id, :user_id))

    redirect_to @recipe
  end
end
