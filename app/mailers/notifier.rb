class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"
  
  def comment_updated(comment, user)
    @comment = comment
    @user = user
    mail( :from => "Ticketee <francoB411test+#{comment.project.id}+#{comment.ticket.id}@gmail.com>",
          :to => user.email,
          :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
