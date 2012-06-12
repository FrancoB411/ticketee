require 'spec_helper'

describe "Proejct API errors", :type => :api do
  context "Standard users" do
    let(:user) { create_user! }
    
    it "cannot create projects" do
      post "/api/v1/projects.json",
        :token    =>  user.authentication_token,
        :project  => {
          :name => "Ticketee"
        }
      error = { :error => "You must be an admin to do that."}
      last_response.body.should eql(error.to_json)
      last_response.status.should eql(401)
      Project.find_by_name("Tickete").should be_nil
    end
  end
  
  
end
