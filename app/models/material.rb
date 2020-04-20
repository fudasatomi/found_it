class Material < ApplicationRecord

	belongs_to :recipe

	attachment :image

	validates :recipe_id, presence: true
	validates :name, presence: true
	validates :quantity, presence: true

	def self.ransackable_attributes(auth_object = nil)
    %w(name)
	end

end
