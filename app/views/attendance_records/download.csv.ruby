require 'csv'

CSV.generate do |csv|
  @attendance_records.each do |attendance_record|
    csv << [
      attendance_record.start_time.strftime('%-m/%-d'),
      attendance_record.end_time.strftime('%-m/%-d'),
      formatted_duration(attendance_record.break_time),
      formatted_duration(attendance_record.end_time - attendance_record.start_time - attendance_record.break_time),
      'place',
      attendance_record.memo
    ]
  end
end
