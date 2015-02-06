class Payment < ActiveRecord::Base
  belongs_to :lease
end
