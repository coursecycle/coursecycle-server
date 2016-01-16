require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term = terms(:one)
  end

  test "should get index" do
    get terms_url
    assert_response :success
  end

  test "should create term" do
    assert_difference('Term.count') do
      post terms_url, params: { term: { title: @term.title } }
    end

    assert_response 201
  end

  test "should show term" do
    get term_url(@term)
    assert_response :success
  end

  test "should update term" do
    patch term_url(@term), params: { term: { title: @term.title } }
    assert_response 200
  end

  test "should destroy term" do
    assert_difference('Term.count', -1) do
      delete term_url(@term)
    end

    assert_response 204
  end
end
