class Pokemon < ApplicationRecord
  has_many :types
  has_many :abilities
end
