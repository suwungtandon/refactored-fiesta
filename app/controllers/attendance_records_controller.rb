class AttendanceRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance_record = AttendanceRecord.new(attendance_record_params)
  end

  def create
    prms = attendance_record_params.merge({ user: current_user })
    prms[:break_time] = parse_time_to_duration(prms[:break_time])

    if AttendanceRecord.create(prms)
      flash[:notice] = 'Created !'
    else
      flash[:alert] = 'Failed to create !!'
    end

    redirect_to controller: :index, action: :index
  end

  def edit
    @attendance_record = AttendanceRecord.find(params[:id])
  end

  def update
    @attendance_record = AttendanceRecord.find(params[:id])

    if @attendance_record.update_attributes!(attendance_record_params)
      flash[:notice] = 'Updated !'
    else
      flash[:alert] = 'Failed to update !!'
    end

    redirect_to controller: :index, action: :index
  end

  def destroy
    @attendance_record = AttendanceRecord.find(params[:id])

    if @attendance_record.destroy!
      flash[:notice] = 'Destroyed !'
    else
      flash[:alert] = 'Failed to destroy !!'
    end

    redirect_to controller: :index, action: :index
  end

  private
  def attendance_record_params
    params.require('attendance_record').permit(:start_time, :end_time, :break_time, :memo)
  end

  def parse_time_to_duration(dtime)
    ret = dtime.match(/^(\d+):(\d+):(\d+)$/)

    raise 'Fucking format' unless ret.size == 4

    (ret[1].to_i.hours + ret[2].to_i.minutes + ret[3].to_i.seconds).to_i
  end
end
