class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  attachment :image

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships

  has_many :follower, foreign_key: "follower_id",
                      class_name: "Relationship",
                      dependent: :destroy

  has_many :following_user, through: :follower, source: :following

  has_many :following, foreign_key: "following_id",
                       class_name: "Relationship",
                       dependent: :destroy

  has_many :follower_user, through: :following, source: :follower

  def following?(user)
    following_user.include?(user)
  end

  def follow(user_id)
    follower.create(following_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(following_id: user_id).destroy
  end

end
