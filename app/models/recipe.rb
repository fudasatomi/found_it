class Recipe < ApplicationRecord

	belongs_to :category
	belongs_to :user

	has_many :materials, dependent: :destroy
	has_many :procedures, dependent: :destroy
	has_many :favorites, dependent: :destroy
	    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
    has_many :comments, dependent: :destroy

	attachment :image

	validates :title, presence: true
	validates :outline, presence: true
	validates :category_id, presence: true

  	def self.ransackable_attributes(auth_object = nil)
    %w(title outline)
	end

	def if_is_closed
		koukai = "公開"
		hikoukai = "非公開"
		if true == is_closed
			hikoukai
		else
			koukai
		end
	end
end
