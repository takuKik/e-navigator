class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :interview_date, null: false
      t.integer :interview_status, null: false, default: 0

      t.timestamps
    end
  end
end
