ActionMailer::Base.smtp_settings = {
    :user_name  =>  "francob411test@gmail.com",
    :password   =>  "francob411test",
    :address    =>  "smtp.gmail.com",
    :port       =>  465,
    :ssl        =>  true
}
# ActionMailer::Base.smtp_settings = {
#     :address                => "smtp.gmail.com",
#     :port                   => 587,
#     :domain                 => "gmail.com",
#     :user_name              => "francob411test@gmail.com",
#     :password               => "francob411test",
#     :authentication         => "plain",
#     :enable_starttls_auto   => "true"
# }