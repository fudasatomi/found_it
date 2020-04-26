class FavoritesController < ApplicationController
  before_action :authenticate_user!,except:[:favorite]
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
    if @user == current_user
      @recipes = @user.favorite_recipes.includes(:user).page(params[:page]).reverse_order
    else
      @recipes = @user.favorite_recipes.includes(:user).where(is_closed: false).page(params[:page]).reverse_order
    end
  end

end
