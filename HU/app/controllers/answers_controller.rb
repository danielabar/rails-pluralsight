class AnswersController < ApplicationController
  def create
    # read answer params, then read question_id from the answer param
    question = Question.find(params[:answer][:question_id])

    # Answer.create(answer_params)
    answer = question.answers.create(answer_params)

    # Notify question author via email that a new answer is available
    # MainMailer.notify_question_author(answer).deliver_now
    puts "=== ANSWERS CONTROLLER: SENDING EMAIL FOR LATER"
    MainMailer.notify_question_author(answer).deliver_later

    session[:current_user_email] = answer_params[:email]

    # rails will figure out what url to use to redirect to page that displays the question
    redirect_to question
  end

  private

  def answer_params
    # Don't need question_id in required params when using question.answers.create rather than Answer.create
    # params.require(:answer).permit(:question_id, :email, :body)
    params.require(:answer).permit(:email, :body)
  end
end
