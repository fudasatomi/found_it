class Recipe < ApplicationRecord

	belongs_to :category
	belongs_to :user

	has_many :materials, dependent: :destroy
	accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true
	has_many :prosesses, dependent: :destroy
	accepts_nested_attributes_for :prosesses, reject_if: :all_blank, allow_destroy: true
	has_many :favorites, dependent: :destroy
	    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
    has_many :book_comments, dependent: :destroy

	attachment :image

	validates :title, presence: true
	validates :outline, presence: true
	#validates :image_id, presence: true
	#validates :category_id, presence: true

	def if_is_closed
		koukai = "公開"
		hikoukai = "非公開"
		if true == is_active
			hikoukai
		else
			koukai
		end
	end
end
