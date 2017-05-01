class AddMemoToAttendanceRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :attendance_records, :memo, :string
  end
end
