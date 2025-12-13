class CreateCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.integer :credits
      t.string :semester
      t.text :description

      t.timestamps
    end
  end
end
