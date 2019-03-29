class ChangeColumnToInterviews < ActiveRecord::Migration[5.1]
  def change
    change_column :interviews, :user_id, :integer, null: false, foreign_key: true
  end
end
