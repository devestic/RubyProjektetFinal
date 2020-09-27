class Coffe < ApplicationRecord
        #La till valideringar jag tyckte kändes vettiga
        validates :name, presence: true, length: { minimum: 2}
        validates :articlenbr, presence: true, uniqueness: true, length: { minimum: 2}
        validates :price, presence: true
        validates :description, presence: true
    end
 