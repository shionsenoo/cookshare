class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :post_id

  validates :text, presence: true
end
