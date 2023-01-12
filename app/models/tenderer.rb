class Tenderer < ApplicationRecord

    has_secure_password

    has_many :tenders
    has_many :suppliers, through: :tenders
end
