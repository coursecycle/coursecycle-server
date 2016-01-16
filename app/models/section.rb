class Section < ApplicationRecord
  belongs_to :course
  belongs_to :term
  has_and_belongs_to_many :instructors
end
