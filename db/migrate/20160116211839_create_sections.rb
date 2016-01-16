class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.number :course_id
      t.number :term_id
      t.datetime :start
      t.datetime :end
      t.string :location

      t.timestamps
    end
  end
end
