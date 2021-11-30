class Camper < ApplicationRecord

    validates :name, :age, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 8, less_than_or_equal_to: 18 }
    
    has_many :signups
    has_many :activities, through: :signups
    
end
