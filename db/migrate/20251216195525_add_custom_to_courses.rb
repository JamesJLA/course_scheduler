class AddCustomToCourses < ActiveRecord::Migration[8.1]
  def change
    add_column :courses, :custom, :boolean, default: false, null: false
    add_index :courses, :custom
  end
end
