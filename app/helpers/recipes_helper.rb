module RecipesHelper
  def liked_recipes
    if current_user
      likes = Like.where(user_id: current_user["uid"])
      @liked_recipes = []
      likes.each do |like|
        @liked_recipes.push(Recipe.find(like.recipe_id))
      end
    end
  end
end
