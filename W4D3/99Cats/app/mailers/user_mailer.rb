class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user 
        @url = 'www.whateverdudeiamtired.com'
        mail(to: 'aramsargsyan990@gmail.com', subject: "hey, mister")
    end
end
