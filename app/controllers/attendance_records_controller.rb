class AttendanceRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance_record = AttendanceRecord.new(attendance_record_params)
  end

  def create
    AttendanceRecord.create(attendance_record_params.merge({ user: current_user }))

    # flash note

    redirect_to controller: :index, action: :index
  end

  def edit
    @attendance_record = AttendanceRecord.find(params[:id])
  end

  def update
    AttendanceRecord.update_attributes!(attendance_record_params)

    # flash note
    redirect_to controller: :index, action: :index
  end

  def destroy
    @attendance_record = AttendanceRecord.find(params[:id])

    @attendance_record.destroy!

    # flash note
    redirect_to controller: :index, action: :index
  end

  private
  def attendance_record_params
    params.require('attendance_record').permit(:start_time, :end_time, :break_time, :memo)
  end
end
