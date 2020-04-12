class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @material = @recipe.materials.build
    @procedure = @recipe.procedures.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
    #if @recipe.save
    # redirect_to detail_new_recipe_path(@recipe)
    #else
    # render :new
    #end
  end

  def detail_new
    @recipe = Recipe.find(params[:id])
    @material = @recipe.materials.build
    @prosesse = Prosesse.new
  end

  def detail_create
    @recipe = Recipe.find(params[:id])

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
          :title,:outline, :image, :category_id, :is_closed,
          materials_attributes:[:id, :recipe_id,:name, :image, :quantity, :maker,:_destroy])
      end
      #def material_params
       # params.require(:material).permit(:recipe_id, :name, :image, :quantity, :maker)
      #end
      #def prosess_params
       # params.require(:prosess).permit(:recipe_id, :image, :explanation)
      #end
end
