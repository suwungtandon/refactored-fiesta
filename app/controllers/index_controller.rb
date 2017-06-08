class IndexController < ApplicationController
  def index
    unless current_user.present?
      render 'welcome', layout: false
      return
    end

    year = (params[:year] || Time.now.year).to_i
    month = (params[:month] || Time.now.month).to_i

    @target_month = Date.new(year, month, 1)

    beginning_of_month = @target_month.beginning_of_month
    end_of_month = @target_month.end_of_month

    @attendance_records = AttendanceRecord.where(user: current_user, start_time: beginning_of_month .. end_of_month)

    return unless AttendanceRecord.where(user: current_user).present?

    first_record = AttendanceRecord.where(user: current_user).first.start_time.to_date
    last_record = AttendanceRecord.where(user: current_user).last.start_time.to_date

    @candidate_months = (first_record .. last_record).map(&:beginning_of_month).uniq
  end
end
