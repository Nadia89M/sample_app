# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
<<<<<<< HEAD

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
=======
>>>>>>> parent of 1fffec5... 5.3: Sending Emails (1)
