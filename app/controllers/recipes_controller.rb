class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @material = @recipe.materials.build
    @procedure = @recipe.procedures.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to new_recipe_material_path(@recipe)
    else
     render :new
    end
  end

  def index
    @category_list = ParentCategory.all
    @recipes = Recipe.where(is_closed: false)
  end

  def category_all_index
    @category_list = ParentCategory.all
    @parent_category = ParentCategory.find(params[:id])
    @recipes = @parent_category.recipes.where(is_closed: false)
  end

  def category_index
    @category_list = ParentCategory.all
    @category = Category.find(params[:id])
    @recipes = @category.recipes.where(is_closed: false)
  end

  def show
    @category_list = ParentCategory.all
    @recipe = Recipe.find(params[:id])
    @materials = @recipe.materials
    @procedures = @recipe.procedures
    @comments = @recipe.comments
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @materials = @recipe.materials
    @procedures = @recipe.procedures
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

    private
      def recipe_params
        params.require(:recipe).permit(
          :title,:outline, :image, :category_id, :is_closed)
      end
end
