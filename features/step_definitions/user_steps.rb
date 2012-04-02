Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
      @user = User.create!(attributes)
      @user.confirm! unless unconfirmed
  end
end


Given /^"([^"]*)" opens the email with subject => "([^"]*)"$/ do |arg1, arg2|
  open_email arg1
end