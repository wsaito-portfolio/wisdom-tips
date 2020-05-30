class Reason < ApplicationRecord
  belongs_to :tip, optional: true
  validates :content,presence: true,length: {maximum: 100}
end
