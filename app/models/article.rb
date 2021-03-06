class Article < ApplicationRecord
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  belongs_to :user, counter_cache: true
  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates :user_id, presence: true
end
