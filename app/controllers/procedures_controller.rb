class ProceduresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @materials = Material.where(recipe_id: @recipe.id)
    @procedures = Procedure.where(recipe_id: @recipe.id)

    @procedure = Procedure.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])

    @procedure = Procedure.new(procedure_params)
    @procedure.recipe_id = @recipe.id
    if @procedure.save
        redirect_to new_recipe_procedure_path(@recipe)
    else
      @recipe = Recipe.find(params[:recipe_id])
      @materials = Material.where(recipe_id: @recipe.id)
      @procedures = Procedure.where(recipe_id: @recipe.id)
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    procedure = Procedure.find(params[:id])
    procedure.destroy
    redirect_to new_recipe_procedure_path
  end

  private
  def procedure_params
     params.require(:procedure).permit(:recipe_id,:image, :explanation)
  end
end
