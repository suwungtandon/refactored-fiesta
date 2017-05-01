class AddHourlyWageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hourly_wage, :integer
  end
end
