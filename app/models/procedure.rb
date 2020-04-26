class Procedure < ApplicationRecord
	belongs_to :recipe

	attachment :image

    validates :recipe_id, presence: true
	validates :explanation, presence: true, length: {maximum: 100, minimum: 2
	}

	def self.ransackable_attributes(auth_object = nil)
    %w(name)
	end
end
