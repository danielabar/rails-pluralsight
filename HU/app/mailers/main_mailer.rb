class MainMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.notify_question_author.subject
  #
  def notify_question_author(answer)
    # simulate slow mailer
    puts "=== MAIN MAILER: STARTING 5 SECOND SLEEP"
    sleep 5 # 5 seconds
    puts "=== MAIN MAILER: FINISHED 5 SECOND SLEEP"
    @greeting = "Hi"
    @answer = answer

    mail to: answer.question.email, from: answer.email
  end
end
