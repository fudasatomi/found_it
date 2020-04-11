class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @material = @recipe.materials.build
    #@prosesse = @recipe.prosesses.build
  end

  def create
    @recipe = Recipe.new(recipe_params) #recipeモデルのテーブルを使用しているのでrecipeコントローラで保存する。
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to detail_new_recipe_path(@recipe)
    else
      render :new
    end
  end

  def detail_new
    @recipe = Recipe.find(params[:id])
    @material = @recipe.materials.build
    @prosesse = Prosesse.new
  end

  def detail_create
    @recipe = Recipes.find(params[:id])

    @material = Material.new
    @material.recipe_id = @recipe.id
    @material.save

    @prosesse = Prosesse.new
    @prosess.recipe_id = @recipe.id
    @prosess.save

    redirect_to recipe_path(@recipe)
  end

  def index
    @category = Category.includes(:children).where(parent_id: "0")
    @recipes = Recipe.all
  end

  def category_index
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
  end

    private
      def recipe_params
        params.require(:recipe).permit(
          :title,:outline, :image, :category_id, :is_closed,
          materials_attributes:[:name, :image, :quantity, :maker,:_destroy])
      end
      #def material_params
       # params.require(:material).permit(:recipe_id, :name, :image, :quantity, :maker)
      #end
      #def prosess_params
       # params.require(:prosess).permit(:recipe_id, :image, :explanation)
      #end
end
