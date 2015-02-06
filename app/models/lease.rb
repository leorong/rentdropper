class Lease < ActiveRecord::Base
  belongs_to :owner
  belongs_to :renter
  belongs_to :property
  has_many :payments
end
