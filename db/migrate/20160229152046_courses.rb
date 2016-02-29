class Courses < ActiveRecord::Migration
  def change
    create_table :course do |t|
      t.text :name
      t.integer :teacher_id
      t.integer :student_id
    end
  end
end
