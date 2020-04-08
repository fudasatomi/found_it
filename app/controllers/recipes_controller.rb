class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params) #recipeモデルのテーブルを使用しているのでrecipeコントローラで保存する。
    @recipe.user_id = current_user.id
    # if
    @recipe.save #入力されたデータをdbに保存する。
    redirect_to @recipe, notice: "successfully created recipe!"#保存された場合の移動先を指定。
    # else
      # @recipes = recipe.all
      # render 'index'
    # end
  end

  def index
  end

  def category_index
  end

  def show
  end

  def edit
  end


  private
    def recipe_params
      params.require(:recipe).permit(:title,:outline, :image, :category_id, :is_closed )
    end
end
