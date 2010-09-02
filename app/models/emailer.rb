class Emailer < ActionMailer::Base

  def account_confirmation(user)
    @user = user
    recipients  @user.email
    from        "ICCA Registry (iccaregistry.org)"
    subject     "Account confirmation from ICCARegistry.org"
    body        :user => user
  end

  def mail_user_new_password(contributor, new_password)
    recipients  contributor.email
    from        "Global Coral Disease Database (coraldisease.org)"  
    from        "ICCA Registry (iccaregistry.org)"
    subject     "ICCA Password Reset"
    body        :contributor => contributor, :new_password => new_password
  end
end
