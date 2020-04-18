class ParentCategory < ApplicationRecord
	has_many :category
	has_many :recipes, through: :category
end
