class Recipe < ApplicationRecord

	belongs_to :categories
	belongs_to :users


	validates :title, presence: true
	validates :outline, presence: true
	validates :image_id, presence: true
	validates :category_id, presence: true
	validates :category_id, presence: true

	def if_is_closed
		koukai = "公開"
		hikoukai = "非公開"
		if true == is_active
			hikoukai
		else
			koukai
		end
	end
end
