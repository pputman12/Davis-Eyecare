class Appointment < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :phone_number, :email, :reason, :comments, :shipping_name, :shipping_address, :shipping_phone, :shipping_email]

  validates :name, :presence => true, :uniqueness => true
  
end
