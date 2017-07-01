require 'csv'

CSV.generate(col_sep: "\t") do |csv|
  @attendance_records.each do |attendance_record|
    csv << [
      attendance_record.start_time.strftime('%-m/%-d'),
      attendance_record.start_time.strftime('%-H:%M'),
      attendance_record.end_time.strftime('%-H:%M'),
      formatted_duration(attendance_record.break_time),
      formatted_duration(attendance_record.end_time - attendance_record.start_time - attendance_record.break_time),
      '自宅',
      attendance_record.memo
    ]
  end
end
