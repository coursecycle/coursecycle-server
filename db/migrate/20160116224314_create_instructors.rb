class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :sunet
      t.string :role

      t.timestamps
    end
  end
end
