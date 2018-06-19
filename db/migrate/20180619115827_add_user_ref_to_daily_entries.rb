class AddUserRefToDailyEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :daily_entries, :user, foreign_key: true
  end
end
