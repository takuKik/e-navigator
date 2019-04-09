class InterviewsController < ApplicationController
  before_action :set_user, except: [:destroy, :setup]
  before_action :set_interview, only: [:edit, :update, :destroy, :setup]

  def index
    @interviews = @user.interviews.order("interview_date DESC")
  end

  def show
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

  def setup
    others = Interview.where(user_id: params[:user_id]).where.not(id: params[:id])
    if @interview.update(interview_status: 1)
      others.update_all(interview_status: 2)
      redirect_to user_interviews_url(params[:user_id]), notice: "面談日時が設定されました。"
    else
      render action: :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date)
  end
end
