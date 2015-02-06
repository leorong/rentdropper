class Renter < ActiveRecord::Base
  has_many :leases
  has_many :owners, :through => leases
end
