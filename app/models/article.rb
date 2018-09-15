class Article < ApplicationRecord
  belongs_to :user, :counter_cache => true
  validates :title, presence: true, length: {minimum: 3, maximum: 80}
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates :user_id, presence: true
end
