class Category < ApplicationRecord

	has_many :recipes

	belongs_to :parent_category

end