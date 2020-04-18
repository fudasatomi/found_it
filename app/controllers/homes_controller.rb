class HomesController < ApplicationController
  def top
	@category_list = ParentCategory.all
  end

  def about
  end
end
