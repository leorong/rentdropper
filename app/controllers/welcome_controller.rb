class WelcomeController < ApplicationController
	def index
		@message = "Hi, Welcome to Rent Dropper!"

		# Create a property for the lease
		@property =  Property.new(address: '1317 Carlin Court', city: 'Burlington', state: 'WI', zip_code: '53105')
		@property.save

		# Create a owner for the lease
		@owner = Owner.new(venmo_id: 1, email: 'wang.xinlei15@gmail.com', password: '12345')
		@owner.save

		# Create a renter for the lease
		@renter = Renter.new(venmo_id: 2, email: 'wang8@stanford.edu', password: '12345')
		@renter.save

		# Create a new lease on the property
		@lease = Lease.new(pmt_amount: 1000, due_date: 1, start_date: '2010-02-11 11:02:57', end_date: '2011-02-11 11:02:57')
		@lease.property = @property
		@lease.owner = @owner
		@lease.renter = @renter
		@lease.save

		# Create a payment for the lease
		@payment = @lease.payments.build(pmt_month: 6, pmt_year: 2012, pmt_amount: 1000, completed_date: '2010-02-11 11:02:57')

	end
end
