class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :sunet
      t.string :role

      t.timestamps
    end
  end
end
