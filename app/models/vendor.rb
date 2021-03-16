class Vendor < ApplicationRecord
  belongs_to :purchaser
  has_many :orders
end
