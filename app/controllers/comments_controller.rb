class CommentsController < ApplicationController
  def create
  	recipe = Recipe.find(params[:recipe_id])
    comment = current_user.comments.new(comment_params)
    comment.recipe_id = recipe.id
    if comment.save
      redirect_to recipe_path(recipe)
    else
      @comments = Comment.where(recipe_id: recipe.id)
      render "recipes/show"
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    comment = Comment.find(params[:id])
    if comment.user == current_user
      comment.destroy
      redirect_to recipe_path(recipe)
    else
      redirect_to request.referer
    end
  end

	private
	  def comment_params
	  	params.require(:comment).permit(:comment)
	  end
end
