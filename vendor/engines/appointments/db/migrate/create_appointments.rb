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
      t.integer :position

      t.timestamps
    end

    add_index :appointments, :id

    load(Rails.root.join('db', 'seeds', 'appointments.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "appointments"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/appointments"})
    end

    drop_table :appointments
  end

end
