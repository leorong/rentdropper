class CreatePayments < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.integer :venmo_id
      t.string :email
      t.string :password
    end

    create_table :owners do |t|
      t.integer :venmo_id
      t.string :email
      t.string :password
    end

    create_table :leases do |t|
      t.references :renter, index: true
      t.references :owner, index: true
      t.references :property, index: true
      t.float :pmt_amount
      t.integer :due_date
      t.datetime :start_date
      t.datetime :end_date
    end

    create_table :payments do |t|
      t.references :lease, index: true
      t.integer :pmt_month
      t.integer :pmt_year
      t.float :pmt_amount
      t.integer :completed_date
    end

    create_table :properties do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
    end
  end
end
