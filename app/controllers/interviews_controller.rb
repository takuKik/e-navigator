class InterviewsController < ApplicationController
  before_action :set_user, except: :destroy
  before_action :set_interview, only: [:edit, :update, :destroy]

  def index
    @interviews = current_user.interviews.order("interview_date DESC")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user_id = params[:user_id]

    if @interview.save
      redirect_to user_interviews_url, notice: "新規面接日程を作成しました。"
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if  @interview.update(interview_params)
      redirect_to user_interviews_url, notice: "面接日時を更新しました。"
    else
      render action: :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_url, notice: "面接日時を削除しました。"
  end

  private
  def set_user
    @user = current_user
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date)
  end
end
