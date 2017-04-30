class IndexController < ApplicationController
  def index
    target_date = params[:target_date] || Time.now

    @attendance_records = AttendanceRecord.where(user: current_user)
  end


end
