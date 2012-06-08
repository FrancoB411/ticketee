require "spec_helper"

describe Notifier do
  it  "correctly sets the reply-to" do
    comment = FactoryGirl.create(:comment)
    mail = ActionMailer::Base.deliveries.last
    #raise mail.inspect
    mail.from.should eql(["francoB411test+#{comment.project.id}+#{comment.ticket.id}@gmail.com"])
    end
end
