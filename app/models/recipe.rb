class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, presence: true, inclusion: { in: [true, false] }
  validates :public, presence: true, exclusion: nil
end
