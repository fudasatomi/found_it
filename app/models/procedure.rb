class Procedure < ApplicationRecord
	belongs_to :recipe

	attachment :image

    validates :recipe_id, presence: true
	validates :explanation, presence: true

	def self.ransackable_attributes(auth_object = nil)
    %w(name)
	end
end
