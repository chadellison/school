class UpdateStudentsTable < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.integer :age
    end
  end
end
