class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:like]

  def index
    @recipes = Recipe.all.sample(10)
    @recipe = Recipe.new
    @user = session[:userinfo]
    liked_recipes
    previously_cooked
    @salad_recipes = recipe_search("Salad")
    @chicken_recipes = recipe_search("Chicken")
    @vegetarian_recipes = recipe_search("Vegetarian")
  end

  def show
    @meal_plans = @recipe.meal_plans
    @likes = @recipe.likes
    if current_user
      @like = Like.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first
    end
    @recipe_source = RecipeSource.friendly.find(@recipe.recipe_source.id)
    is_current_recipe_on_list
    people_also_liked
    related_recipes(@recipe)
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    s = URI.parse(recipe_params[:link])
    domain_segments = s.host.split('.')
    if domain_segments.count > 2
      domain = domain_segments[1] + "." + domain_segments[2]
    else
      domain = s.host
    end
    @recipe_source = RecipeSource.where(domain: domain).first
    unless @recipe_source.blank?
      @recipe = @recipe_source.recipes.where(link: recipe_params[:link]).first_or_initialize(params[:recipe].permit(:name, :link, :ingredients, :image_url))
    else
      false
    end

    respond_to do |format|
      if @recipe && @recipe.save
        format.html { redirect_to recipe_source_recipe_path(@recipe_source, @recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
        if current_user
          like = @recipe.likes.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first || @recipe.likes.build(recipe_id: @recipe.id, user_id: current_user["uid"])
          like.save
        end
      else
        recipe_info = {
          pretext: "Someone tried (unsuccessfully) to create a recipe.",
          title: "#{recipe_params[:link]}",
          title_link: "#{recipe_params[:link]}",
          color: "#5a4753",
        }
        RECIPE_NOTIFIER.ping(attachments: [recipe_info])
        format.html { redirect_to recipes_path, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @recipe = Recipe.friendly.find(params[:id])
    @like = @recipe.likes.create(recipe_id: @recipe.id, user_id: current_user["uid"])
    redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe)
  end

  def unlike
    @recipe = Recipe.friendly.find(params[:id])
    @like = @recipe.likes.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first
    @like.destroy
    redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(
        :name, :link, :ingredients, :image_url,
        meal_plans_params: [:recipe_id, :user_id, :status],
        likes_params: [:recipe_id, :user_id]
      )
    end
end
