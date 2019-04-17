class HomeController < ApplicationController
  def index
    # Read in all Questions and store them in instance variable
    # By convetion, all instance variables are available in view
    @questions = Question.order(created_at: :desc).all
  end

  def about
  end

  def temp
    redirect_to root_path
  end
end
