require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { code: @course.code, description: @course.description, subject: @course.subject, title: @course.title } }
    end

    assert_response 201
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { code: @course.code, description: @course.description, subject: @course.subject, title: @course.title } }
    assert_response 200
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_response 204
  end
end
