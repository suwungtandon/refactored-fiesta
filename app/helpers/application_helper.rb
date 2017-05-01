module ApplicationHelper
  def formatted_duration(duration)
    "%02d:%02d:%02d" % [ duration / 60 / 60, duration / 60 % 60, duration % 60 ]
  end

  def formatted_time_with_break_time(attendance_record)
    start_time = attendance_record.start_time.strftime('%X')
    end_time = attendance_record.end_time.strftime('%X')
    break_time = formatted_duration(attendance_record.break_time)

    "#{start_time} - #{end_time} (#{break_time})"
  end

  def total_working_time(attendance_records)
    attendance_records.inject(0) do |acc, attendance_record|
      acc + (attendance_record.end_time - attendance_record.start_time - attendance_record.break_time)
    end
  end
end
