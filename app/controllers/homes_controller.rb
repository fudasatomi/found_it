class HomesController < ApplicationController
  def top
	@categories = Category.includes(:children).where(parent_id: "0")
  end

  def about
  end
end
