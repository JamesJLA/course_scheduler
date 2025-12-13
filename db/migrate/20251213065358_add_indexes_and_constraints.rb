class AddIndexesAndConstraints < ActiveRecord::Migration[8.1]
  def change
    add_index :courses, :code, unique: true
    add_index :courses, :semester
    add_index :enrollments, :status
    add_index :enrollments, [ :user_id, :course_id ], unique: true

    change_column_default :enrollments, :status, "pending"
  end
end
