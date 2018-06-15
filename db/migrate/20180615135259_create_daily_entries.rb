class CreateDailyEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_entries do |t|
      t.string :prefix, default: 'Dear Diary'
      t.text :body

      t.timestamps
    end
  end
end
