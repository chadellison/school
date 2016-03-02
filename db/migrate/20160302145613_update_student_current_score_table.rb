class UpdateStudentCurrentScoreTable < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.integer :current_score
    end
  end
end
