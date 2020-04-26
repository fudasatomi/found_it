class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def new
  	@recipe = Recipe.find(params[:recipe_id])
    @materials = @recipe.materials
    @procedures = @recipe.procedures

    @material = Material.new
  end

  def create
  	@recipe = Recipe.find(params[:recipe_id])

  	@material = Material.new(material_params)
    @material.recipe_id = @recipe.id
    if @material.save
      	redirect_to new_recipe_material_path(@recipe)
    else
    	@recipe = Recipe.find(params[:recipe_id])
      @materials = @recipe.materials
      @procedures = @recipe.procedures
    	render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    if @material.update(material_params)
      redirect_to new_recipe_material_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
  	material = Material.find(params[:id])
  	material.destroy
  	redirect_to request.referer
  end

  private
	def material_params
   	 params.require(:material).permit(:recipe_id, :name, :image, :quantity, :maker)
  	end
end
