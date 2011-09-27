Given /^I have no appointments$/ do
  Appointment.delete_all
end

Given /^I (only )?have appointments titled "?([^\"]*)"?$/ do |only, titles|
  Appointment.delete_all if only
  titles.split(', ').each do |title|
    Appointment.create(:name => title)
  end
end

Then /^I should have ([0-9]+) appointments?$/ do |count|
  Appointment.count.should == count.to_i
end
