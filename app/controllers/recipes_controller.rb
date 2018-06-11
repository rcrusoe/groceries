class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.take(4)
    @recipe = Recipe.new
    @user = session[:userinfo]
    liked_recipes
  end

  def show
    @meal_plans = @recipe.meal_plans
    @likes = @recipe.likes
    if current_user
      @like = Like.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first
    end
    @recipe_source = RecipeSource.friendly.find(@recipe.recipe_source.id)
    is_current_recipe_on_list
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
    @recipe = @recipe_source.recipes.where(link: recipe_params[:link]).first_or_initialize(params[:recipe].permit(:name, :link, :ingredients, :image_url))

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_source_recipe_path(@recipe_source, @recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
        if current_user
          like = @recipe.likes.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first || @recipe.likes.build(recipe_id: @recipe.id, user_id: current_user["uid"])
          like.save
        end
      else
        format.html { render :new }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(
        :name, :link, :ingredients, :image_url, :encoded_image,
        meal_plans_params: [:recipe_id, :user_id, :status],
        likes_params: [:recipe_id, :user_id]
      )
    end
end
