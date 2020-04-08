class Category < ApplicationRecord

	has_many :recipes

	validates :name, presence: true
	validates :parent_id, presence: true

end