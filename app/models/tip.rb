class Tip < ApplicationRecord
  has_many :reasons, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id,presence: true
  validates :content,presence: true,length: {maximum: 100}
  accepts_nested_attributes_for :reasons,allow_destroy: true
end
