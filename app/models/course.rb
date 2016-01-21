class Course < ApplicationRecord
  include PgSearch
  has_many :sections
  pg_search_scope :search_course,
    :against => [
      [:subject, 'A'],
      [:code, 'B'],
      [:title, 'C']
    ],
    :using => {
      :tsearch => {
        :only => [:subject, :code],
        :prefix => true
      }
    }
end
