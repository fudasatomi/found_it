class FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
  	favorite = current_user.favorites.build(recipe_id: @recipe.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
  	favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end

  def favorite
    @user = User.find(params[:id])
    @recipes = @user.favorite_recipes.includes(:user)
  end

end
