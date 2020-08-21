class Shelf < ApplicationRecord
    has_many :tips
    belongs_to :user
    validates :name, presence:true, uniqueness:true
end
