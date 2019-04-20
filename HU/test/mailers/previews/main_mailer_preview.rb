# Preview all emails at http://localhost:3000/rails/mailers/main_mailer
class MainMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/main_mailer/notify_question_author
  def notify_question_author
    # Generate some data for test
    # question = Question.create email: 'author@question.com', body: 'mail preview test question'
    # answer = Answer.create email: 'author@answer.com', body: 'mail preview test answer'

    # Associate answer with question by appending it to answers relation on question
    # question.answers << answer

    # Use first answer that happens to be in database
    answer = Answer.first

    # Generate email
    MainMailer.notify_question_author(answer)
  end

end
