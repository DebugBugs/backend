class User < ApplicationRecord
    validates :username, presence: true, length: {minimum: 1}, uniqueness: true
    has_many :records, dependent: :destroy
    has_many :finisheds, dependent: :destroy
end
