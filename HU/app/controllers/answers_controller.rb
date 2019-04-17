class AnswersController < ApplicationController
  def create
    # read answer params, then read question_id from the answer param
    question = Question.find(params[:answer][:question_id])

    # Answer.create(answer_params)
    question.answers.create(answer_params)

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
