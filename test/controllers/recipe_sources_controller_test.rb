require 'test_helper'

class RecipeSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_source = recipe_sources(:one)
  end

  test "should get index" do
    get recipe_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_source_url
    assert_response :success
  end

  test "should create recipe_source" do
    assert_difference('RecipeSource.count') do
      post recipe_sources_url, params: { recipe_source: { link: @recipe_source.link, name: @recipe_source.name, scrape_image: @recipe_source.scrape_image, scrape_ingredient: @recipe_source.scrape_ingredient, scrape_name: @recipe_source.scrape_name, domain: @recipe_source.domain } }
    end

    assert_redirected_to recipe_source_url(RecipeSource.last)
  end

  test "should show recipe_source" do
    get recipe_source_url(@recipe_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_source_url(@recipe_source)
    assert_response :success
  end

  test "should update recipe_source" do
    patch recipe_source_url(@recipe_source), params: { recipe_source: { link: @recipe_source.link, name: @recipe_source.name, scrape_image: @recipe_source.scrape_image, scrape_ingredient: @recipe_source.scrape_ingredient, scrape_name: @recipe_source.scrape_name, domain: @recipe_source.domain } }
    assert_redirected_to recipe_source_url(@recipe_source)
  end

  test "should destroy recipe_source" do
    assert_difference('RecipeSource.count', -1) do
      delete recipe_source_url(@recipe_source)
    end

    assert_redirected_to recipe_sources_url
  end
end
