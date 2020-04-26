class HomesController < ApplicationController
  def top
	@category_list = ParentCategory.all
	@favorite_rank = Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  	@new_recipe = Recipe.where(is_closed: false).order(created_at: :desc).limit(6).page(params[:page]).reverse_order
  end

  def about
  end
end
