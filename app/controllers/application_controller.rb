class ApplicationController < ActionController::API

  def index
    number_of_courses = Course.count
    number_of_sections = Section.count
    number_of_instructors = Instructor.count
    number_of_terms = Term.count

    render json: {
      statistics: {
        courses: number_of_courses,
        sections: number_of_sections,
        instructors: number_of_instructors,
        terms: number_of_terms
      },
      github: "https://github.com/coursecycle/coursecycle-server"
    }
  end

  def search
    q = params[:q].downcase.scan(/(\d+\D{0,3}|\D+)/)
    render json: Course.search_course(q).limit(10)
  end

end
