class AttendanceRecord < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
