class CreateInstructorsAndSections < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors_sections, :id => false do |t|
      t.references :instructor, :section
    end
  end
end
