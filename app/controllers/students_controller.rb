class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:current_score).first(5)
  end
end
