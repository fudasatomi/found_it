class Procedure < ApplicationRecord
	belongs_to :recipe

	attachment :image
end
