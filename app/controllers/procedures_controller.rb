class ProceduresController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @materials = @recipe.materials
    @procedures = @recipe.procedures

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
      @materials = @recipe.materials
      @procedures = @recipe.procedures
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @procedure = Procedure.find(params[:id])
  end

  def update
    @procedure = Procedure.find(params[:id])
    if @procedure.update(procedure_params)
      redirect_to edit_recipe_path(@procedure.recipe_id)
    else
      render :edit
    end
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
