class Owner < ActiveRecord::Base
  has_many :leases
  has_many :renters, :through => :leases
end
