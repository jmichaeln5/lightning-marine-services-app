class Purchaser < ApplicationRecord
  belongs_to :user
  has_many :vendors
end
