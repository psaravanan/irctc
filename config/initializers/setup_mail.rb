ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain 				=> "gmail.com",
  :user_name            => 'saravanan11.in@gmail.com',
  :password             => 'psaravanan11',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
ActionMailer::Base.delivery_method = :smtp