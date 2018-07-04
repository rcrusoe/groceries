class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :likes, only: [:show, :index, :search, :favorites, :cooked]
  before_action :authenticate_user!, only: [:like, :add_to_list]
  before_action :is_admin?, only: [:edit, :update, :destroy]
  after_action :store_location, only: [:show]

  def index
    @recipes = Recipe.all.page params[:page]
    @recipe = Recipe.new
  end

  def show
    @meal_plans = @recipe.meal_plans
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
    @recipe = Recipe.where(link: recipe_params[:link]).first
    identify_recipe_source

    if @recipe.present? && @recipe_source.present?
      if current_user
        like = @recipe.likes.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first || @recipe.likes.build(recipe_id: @recipe.id, user_id: current_user["uid"])
        like.save
      end
      redirect_to recipe_source_recipe_path(@recipe_source, @recipe)
    elsif @recipe_source.present?
      @recipe = @recipe_source.recipes.build(params[:recipe].permit(:name, :link, :ingredients, :image_url))
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
          format.html { redirect_to recipes_url, notice: "Bummer. That link didn't seem to work :/."}
          format.json { render json: @recipe.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        recipe_info = {
          pretext: "Someone tried using a new recipe source.",
          title: "#{recipe_params[:link]}",
          title_link: "#{recipe_params[:link]}",
          color: "#5a4753",
        }
        RECIPE_NOTIFIER.ping(attachments: [recipe_info])
        format.html { redirect_to recipes_url, notice: "Sorry, we don't support this blog or website yet. We've recorded your link and will have it working soon."}
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.'}
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
    @like = @recipe.likes.where(recipe_id: @recipe.id, user_id: current_user["uid"]).first_or_create(user_id: current_user["uid"])
    if params[:login]
      respond_to do |format|
        format.html { redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe), notice: "Howdy, welcome back! Let's get cooking." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def unlike
    @recipe = Recipe.friendly.find(params[:id])
    @like = @recipe.likes.where(user_id: current_user["uid"]).first
    @like.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  def add_to_list
    @recipe = Recipe.friendly.find(params[:id])
    @meal_plan = @recipe.meal_plans.create(recipe_id: @recipe.id, user_id: current_user["uid"], status: "Upcoming")
    redirect_to recipe_source_recipe_path(@recipe.recipe_source, @recipe)
  end

  def remove_from_list
    @meal_plan = MealPlan.find(params[:id])
    @meal_plan.update_column(:status, "Complete")
    @meal_plan.save
    @recipe = Recipe.find(@meal_plan.recipe_id)
    redirect_to session[:user_return_to] || root_path
  end

  def search
    @recipe = Recipe.new
    sample_search_terms
    if params[:term]
      @term = params[:term]
      @term = @term.downcase.tr("-", " ")
      @results = Recipe.where("lower(name) like ?", "%#{@term}%")
      @recipes = @results.page params[:page]
    else
      @recipes = Recipe.all.page params[:page]
    end
  end

  def favorites
    previously_cooked
  end

  def cooked
    previously_cooked
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(
        :name, :link, :ingredients_array, :image_url,
        meal_plans_params: [:recipe_id, :user_id, :status],
        likes_params: [:recipe_id, :user_id],
        ingredients_params: [:recipe_id, :grocery_item_id, :qty, :measurement, :note, :aisle]
      )
    end
end
