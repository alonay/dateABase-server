class Person < ApplicationRecord
  has_many :person_chars
  has_many :chars, through: :person_chars
  has_many :photos
end
