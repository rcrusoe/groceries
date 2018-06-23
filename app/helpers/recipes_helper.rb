module RecipesHelper
  def previously_cooked
    if current_user
      meal_plans = MealPlan.where(user_id: current_user["uid"], status: "Complete")
      @previously_cooked = Set[]
      meal_plans.each do |meal_plan|
        @previously_cooked.add(Recipe.find(meal_plan.recipe_id))
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

  def related_recipes(r)
    terms = r.name.split(" ")
    excluded_terms = ["and"]
    terms = terms.map(&:capitalize) - excluded_terms.map(&:capitalize)
    @related_recipes = []
    terms.each do |term|
      recs = Recipe.where("name like ?", "%#{term}%")
      recs.each do |rec|
        @related_recipes.push(rec) unless rec.name == r.name || @related_recipes.include?(rec)
      end
    end
  end

  def recipe_search(term)
    return Recipe.where("name like ?", "%#{term}%")
  end
end
