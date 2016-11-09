class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, length: {minimum: 5}, presence: true

end
