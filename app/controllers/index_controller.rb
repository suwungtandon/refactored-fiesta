class IndexController < ApplicationController
  def index
    target_date = params[:target_date] || Time.now
    beginning_of_month = target_date.beginning_of_month
    end_of_month = target_date.end_of_month

    @attendance_records = AttendanceRecord.where(user: current_user, start_time: beginning_of_month .. end_of_month)
  end
end
