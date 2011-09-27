class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :reason
      t.datetime :first_date
      t.datetime :second_date
      t.text :comments
      t.boolean :reordercontacts
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_phone
      t.string :shipping_email
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
