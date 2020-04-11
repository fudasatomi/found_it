class Material < ApplicationRecord

	belongs_to :recipe

	attachment :image

	#validates :recipe_id, presence: true
	#validates :name, presence: true
	#validates :image_id, presence: true
	#validates :quantity, presence: true

end
