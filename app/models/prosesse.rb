class Prosesse < ApplicationRecord
	attachment :image

	validates :recipe_id, presence: true
	validates :image_id, presence: true
	validates :explanation, presence: true

end
