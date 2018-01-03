class Char < ApplicationRecord
  has_many :person_chars
  has_many :people, through: :person_chars
end
