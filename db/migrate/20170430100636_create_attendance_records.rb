class CreateAttendanceRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :attendance_records do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.time :break_time

      t.belongs_to :user 

      t.timestamps
    end
  end
end
