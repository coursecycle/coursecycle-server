require "nokogiri"

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course.to_json(:include => [:sections])
  end

  # POST /courses
  # def create
  #   @course = Course.new(course_params)
  #
  #   if @course.save
  #     render json: @course, status: :created, location: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /courses/1
  # def update
  #   if @course.update(course_params)
  #     render json: @course
  #   else
  #     render json: @course.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /courses/1
  # def destroy
  #   @course.destroy
  # end

  # POST /courses/import
  # def import
  #   course = import_xml_course(request.body)
  #   render json: course
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:subject, :code, :title, :description)
    end

    def import_xml_course(xml_course)
      course_doc = Nokogiri::XML(xml_course)

      # Get course identifier
      id = course_doc.at_css("administrativeInformation courseId").content

      # Try to find the course
      if Course.exists?(id)
        course = Course.find(id)
      else
        subject = course_doc.at_css("subject").content
        code = course_doc.at_css("code").content
        title = course_doc.at_css("title").content
        description = course_doc.at_css("description").content

        course = Course.create({
          id: id,
          subject: subject,
          code: code,
          title: title,
          description: description
        })
      end

      # See if sections need to be updated
      course_doc.css("section").each do |section_doc|

        # Get section identifier
        section_id = section_doc.at_css("classId").content

        # Get term identifier
        term_id = section_doc.at_css("termId").content

        # Try to find the term
        if Term.exists?(term_id)
          term = Term.find(term_id)
        else
          term = Term.create({
            id: term_id,
            title: section_doc.at_css("term").content
          })
        end

        # Try to find the section
        if Section.exists?(section_id)
          section = Section.find(section_id)
        else

          # Get the start and end dates/times
          date_format = "%b %e, %Y"
          start_date = Date.strptime(section_doc.at_css("schedules schedule startDate").content, date_format)
          end_date = Date.strptime(section_doc.at_css("schedules schedule endDate").content, date_format)

          time_format = "%l:%M:%S %p"
          start_time = Time.strptime(section_doc.at_css("schedules schedule startTime").content, time_format)
                           .change(:year => start_date.year, :day => start_date.day, :month => start_date.month)
          end_time = Time.strptime(section_doc.at_css("schedules schedule endTime").content, time_format)
                         .change(:year => end_date.year, :day => end_date.day, :month => end_date.month)

          section = Section.create({
            id: section_id,
            course: course,
            location: section_doc.at_css("schedules schedule location").content,
            term: term,
            start: start_time,
            end: end_time
          })
        end

        # Try to find each of the instructors
        section_doc.css("instructors instructor").each do |instructor_doc|
          sunet = instructor_doc.at_css("sunet").content

          if Instructor.exists?(sunet: sunet)
            instructor = Instructor.find_by_sunet(sunet)
          else
            first_name = instructor_doc.at_css("firstName").content
            last_name = instructor_doc.at_css("lastName").content
            middle_name = instructor_doc.at_css("middleName").content
            name = instructor_doc.at_css("name").content
            role = instructor_doc.at_css("role").content

            instructor = Instructor.create({
              sunet: sunet,
              first_name: first_name,
              last_name: last_name,
              middle_name: middle_name,
              role: role,
              name: name
            })
          end

          # Ensure that instructor is associated with section
          unless section.instructor_ids.include?(instructor.id)
            section.instructors << instructor
          end
        end
      end
      return course
    end

end
