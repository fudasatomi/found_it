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
    @category = Category.includes(:children).where(parent_id: "0")
    @recipes = Recipe.all
  end

  def category_index
  end

  def show
    @category = Category.includes(:children).where(parent_id: "0")
    @recipe = Recipe.find(params[:id])
    @materials = Material.where(recipe_id: @recipe.id)
    @procedures = Procedure.where(recipe_id: @recipe.id)
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
          :title,:outline, :image, :category_id, :is_closed)
      end
      #def prosess_params
       # params.require(:prosess).permit(:recipe_id, :image, :explanation)
      #end
end
