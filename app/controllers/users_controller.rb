class UsersController < ApplicationController

  before_action :set_user, only: [:recipes, :show, :edit, :update]

  def recipes
  	@recipes = Recipe.where(user_id: @user.id)
  end

  def show
  	@recipes = Recipe.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def leave
  	@user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end


	private
    def set_user
      @user = User.find(params[:id])
    end

	  def user_params
	    params.require(:user).permit(:name,:image, :introduction)
	  end
end
