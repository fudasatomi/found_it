class CommentsController < ApplicationController
  def create
  	@recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.recipe_id = @recipe.id
    @comment.save
    @comments = @recipe.comments
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comments = @recipe.comments
    if @comment.user != current_user
      redirect_to request.referer
    else
      @comment.destroy
    end
  end

	private
	  def comment_params
	  	params.require(:comment).permit(:comment)
	  end
end
