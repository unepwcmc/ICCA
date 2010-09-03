class Emailer < ActionMailer::Base

  def mail_user_new_password(contributor, new_password)
    recipients  contributor.email
    from        "iccaregistry@unep-wcmc.org"
    subject     "ICCA Password Reset"
    body        :contributor => contributor, :new_password => new_password
  end
end
