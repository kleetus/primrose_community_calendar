class QuestionsController < ApplicationController
  def index
    @questions = Question.find(:all)
  end
  
  
  def create
  end
end
