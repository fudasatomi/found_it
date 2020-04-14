class HomesController < ApplicationController
  def top
	@category = Category.includes(:children).where(parent_id: "0")
  end

  def about
  end
end
