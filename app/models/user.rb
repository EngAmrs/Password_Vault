class User < ApplicationRecord
    has_many :services
    has_secure_password

    validates :username, presence: true, uniqueness: true
end
