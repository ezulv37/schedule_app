class AddAllDayAndMemoToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :all_day, :boolean
    add_column :schedules, :memo, :string
  end
end
