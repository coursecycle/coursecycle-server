class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.integer :term_id
      t.datetime :start
      t.datetime :end
      t.string :location

      t.timestamps
    end
  end
end
