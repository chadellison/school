class TeachersController < ApplicationController
  def index
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "#{@teacher.name} added!"
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end


  def show
    @teacher = Teacher.find(params[:id])
  end

private

  def teacher_params
    params.require(:teacher).permit(:name, :subject)
  end
end
