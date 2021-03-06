class RecipeSourcesController < ApplicationController
  before_action :set_recipe_source, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, except: [:show, :index]
  before_action :likes, only: [:show]

  # GET /recipe_sources
  # GET /recipe_sources.json
  def index
    @recipe_sources = RecipeSource.left_joins(recipes: :likes)
      .group('recipe_sources.id')
      .order('count(likes.id) DESC')
  end

  # GET /recipe_sources/1
  # GET /recipe_sources/1.json
  def show
    @recipes = @recipe_source.recipes.page params[:page]
  end

  # GET /recipe_sources/new
  def new
    @recipe_source = RecipeSource.new
  end

  # GET /recipe_sources/1/edit
  def edit
  end

  # POST /recipe_sources
  # POST /recipe_sources.json
  def create
    @recipe_source = RecipeSource.new(recipe_source_params)

    respond_to do |format|
      if @recipe_source.save
        format.html { redirect_to @recipe_source, notice: 'Recipe source was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_source }
      else
        format.html { render :new }
        format.json { render json: @recipe_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_sources/1
  # PATCH/PUT /recipe_sources/1.json
  def update
    respond_to do |format|
      if @recipe_source.update(recipe_source_params)
        format.html { redirect_to @recipe_source, notice: 'Recipe source was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_source }
      else
        format.html { render :edit }
        format.json { render json: @recipe_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_sources/1
  # DELETE /recipe_sources/1.json
  def destroy
    @recipe_source.destroy
    respond_to do |format|
      format.html { redirect_to recipe_sources_url, notice: 'Recipe source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_source
      @recipe_source = RecipeSource.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_source_params
      params.require(:recipe_source).permit(
        :name, :link, :scrape_name, :scrape_qty, :scrape_measurement, :scrape_ingredient, :scrape_image, :domain, :recipe_index_link, :category_css, :recipe_css, :multiple_pages,
        recipe_params: [:name, :link, :ingredients_array, :image_url]
      )
    end
end
