class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedule_count = @schedules.count
    @today = Date.today
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day))
    if @schedule.save
      flash[:notice] = "予定を新規追加しました"
      redirect_to :schedules
    else
      flash[:notice] = "予定が保存されていません"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "予定が更新されました"
      redirect_to :schedules
    else
      flash[:notice] = "予定が保存されていません"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定が削除されました"
    redirect_to :schedules
  end
end
