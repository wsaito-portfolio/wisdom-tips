class Reason < ApplicationRecord
  belongs_to :tip, optional: false
  validates :content,presence: true,length: {maximum: 100}
  
end
