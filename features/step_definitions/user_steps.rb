Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
      @user = User.create!(attributes)
  end
end


Given /^"([^"]*)" opens the email with subject => "([^"]*)"$/ do |arg1, arg2|
  open_email arg1
end