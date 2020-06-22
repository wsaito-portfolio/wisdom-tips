class UserDetail < ApplicationRecord
    belongs_to :user ,optional: true ,dependent: :destroy
    validates :profile_description, length: {maximum: 200}
end
