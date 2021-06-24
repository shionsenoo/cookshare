class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  attachment :image

  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end