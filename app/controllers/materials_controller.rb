class MaterialsController < ApplicationController
  def new
  	@recipe = Recipe.find(params[:recipe_id])
  	@materials = Material.where(recipe_id: @recipe.id)
    @procedures = Procedure.where(recipe_id: @recipe.id)

    @material = Material.new
    @material.recipe_id = @recipe.id
  end

  def create
  	@recipe = Recipe.find(params[:recipe_id])

  	@material = Material.new(material_params)
    @material.recipe_id = @recipe.id
    if @material.save
      	redirect_to new_recipe_materials_path
    else
    	render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
	def material_params
   	 params.require(:material).permit(:recipe_id, :name, :image, :quantity, :maker)
  	end
end
