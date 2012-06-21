require 'spec_helper'

describe User do
  it "resets user request count" do
    user = FactoryGirl.create( :user )
    user.update_attribute( :request_count, 42 )
    User.reset_request_count! #Does this reset every user or just the one created, if so, how?
    user.reload
    user.request_count.should eql( 0 )
  end
end
