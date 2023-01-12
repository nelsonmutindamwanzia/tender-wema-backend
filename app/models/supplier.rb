class Supplier < ApplicationRecord

    has_secure_password
    
    has_many :proposals

end
