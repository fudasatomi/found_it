class Category < ApplicationRecord
  	belongs_to :parent, class_name: :Category
  	has_many :children, class_name: :Category, foreign_key: :parent_id

	has_many :recipes

	validates :name, presence: true
	validates :parent_id, presence: true

end