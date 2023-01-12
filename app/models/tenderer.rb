class Tenderer < ApplicationRecord

    has_secure_password

    has_many :tenders
end
