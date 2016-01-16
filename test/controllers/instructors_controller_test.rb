require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instructor = instructors(:one)
  end

  test "should get index" do
    get instructors_url
    assert_response :success
  end

  test "should create instructor" do
    assert_difference('Instructor.count') do
      post instructors_url, params: { instructor: { firstName: @instructor.firstName, lastName: @instructor.lastName, middleName: @instructor.middleName, name: @instructor.name, role: @instructor.role, sunet: @instructor.sunet } }
    end

    assert_response 201
  end

  test "should show instructor" do
    get instructor_url(@instructor)
    assert_response :success
  end

  test "should update instructor" do
    patch instructor_url(@instructor), params: { instructor: { firstName: @instructor.firstName, lastName: @instructor.lastName, middleName: @instructor.middleName, name: @instructor.name, role: @instructor.role, sunet: @instructor.sunet } }
    assert_response 200
  end

  test "should destroy instructor" do
    assert_difference('Instructor.count', -1) do
      delete instructor_url(@instructor)
    end

    assert_response 204
  end
end
