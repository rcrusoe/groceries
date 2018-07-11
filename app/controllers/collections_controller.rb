class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :add_to_collection]
  before_action :likes, only: [:show]

  def add_to_collection
    collection = Collection.friendly.find(params[:collection])
    recipe = Recipe.friendly.find(params[:recipe])
    collection.recipes << recipe unless collection.recipes.include?(recipe)
  end

  def remove_from_collection
    collection = Collection.friendly.find(params[:collection])
    recipe = Recipe.friendly.find(params[:recipe])
    collection.recipes.delete(recipe)
    respond_to do |format|
      format.html { redirect_to collection, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @collection = Collection.where(name: collection_params[:name], user_id: current_user["uid"]).first || Collection.new(collection_params)
    @collection.user_id = current_user["uid"]
    recipe = Recipe.find(params[:collection][:recipe])
    if @collection.save
      @collection.recipes << recipe unless @collection.recipes.include?(recipe)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    @collection = Collection.friendly.find(params[:id])
    @recipes = @collection.recipes.page params[:page]
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to my_recipes_collections_path, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def collection_params
      params.require(:collection).permit(
        :name, :user_id
      )
    end
end
