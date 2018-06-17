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

  def people_also_liked
    other_likers = []
    Like.where(recipe_id: @recipe.id).each do |like|
      if current_user
        other_likers.push(like.user_id) unless like.user_id == current_user["uid"]
      else
        other_likers.push(like.user_id)
      end
    end

    @people_also_liked = []
    other_likers.each do |user_id|
      Like.where(user_id: user_id).each do |like|
        @people_also_liked.push(Recipe.find(like.recipe_id)) unless like.recipe_id == @recipe.id
      end
    end
  end

  def recipe_search(term)
    return Recipe.where("name like ?", "%#{term}%")
  end
end
