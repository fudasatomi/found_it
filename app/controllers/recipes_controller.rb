class RecipesController < ApplicationController
  before_action :authenticate_user!,except:[:search,:index,:category_all_index,:category_index,:show]
  before_action :category_list, only: [:search, :index, :category_all_index,:category_index, :show]
  before_action :set_recipe, only: [:show, :edit, :update]


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

  def search
    #ransackの検索で使用する変数は、application_controllerのset_searchで定義済み
  end

  def index
    @recipes = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  def category_all_index
    @parent_category = ParentCategory.find(params[:id])
    @recipes = @parent_category.recipes.where(is_closed: false).page(params[:page]).reverse_order
  end

  def category_index
    @category = Category.find(params[:id])
    @recipes = @category.recipes.where(is_closed: false).page(params[:page]).reverse_order
  end

  def show
    @category = @recipe.category
    @parent_category = @category.parent_category
    @materials = @recipe.materials
    @procedures = @recipe.procedures
    @comments = @recipe.comments
    @comment = Comment.new
  end

  def edit
    @materials = @recipe.materials
    @procedures = @recipe.procedures
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      @materials = @recipe.materials
      @procedures = @recipe.procedures
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

    private
      def category_list #ページの左側のカテゴリーリスト
        @category_list = ParentCategory.all
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(
          :title,:outline, :image, :category_id, :is_closed)
      end
end
