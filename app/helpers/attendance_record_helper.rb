module AttendanceRecordHelper
  def formatted_duration(duration)
    "%02d:%02d:%02d" % [ duration / 60 / 60, duration / 60 % 60, duration % 60 ]
  end
end
