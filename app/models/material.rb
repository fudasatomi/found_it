class Material < ApplicationRecord

	belongs_to :recipe

	attachment :image

	validates :recipe_id, presence: true
	validates :name, presence: true, length: {maximum: 20, minimum: 2
	}
	validates :quantity, presence: true, length: {maximum: 5, minimum: 1
	}

	def self.ransackable_attributes(auth_object = nil)
    %w(name)
	end

end
