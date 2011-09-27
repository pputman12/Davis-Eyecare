require 'spec_helper'

describe Appointment do

  def reset_appointment(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @appointment.destroy! if @appointment
    @appointment = Appointment.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_appointment
  end

  context "validations" do
    
    it "rejects empty name" do
      Appointment.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_appointment
      Appointment.new(@valid_attributes).should_not be_valid
    end
    
  end

end