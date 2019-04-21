class QuestionsController < ApplicationController
  # GET /questions.json
  def index
    @questions = Question.order(created_at: :desc).all
    respond_to do |format|
      format.html # views/questions/index.html.erb
  format.json { render json: @questions }
    end
  end

  # handle GET for a single Question
  def show
    # id from url comes in as :id key of params hash
    @question = Question.find(params[:id])

    @answers = @question.answers.order(created_at: :desc)
  end

  # handle form POST action for Question model
  def create
    Question.create(question_params)
    session[:current_user_email] = question_params[:email]
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:email, :body)
  end

end