require "test_helper"

class Teach::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teach_course = teach_courses(:one)
  end

  test "should get index" do
    get teach_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_teach_course_url
    assert_response :success
  end

  test "should create teach_course" do
    assert_difference("Teach::Course.count") do
      post teach_courses_url, params: { teach_course: { description: @teach_course.description, name: @teach_course.name, teacher_id: @teach_course.teacher_id } }
    end

    assert_redirected_to teach_course_url(Teach::Course.last)
  end

  test "should show teach_course" do
    get teach_course_url(@teach_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_teach_course_url(@teach_course)
    assert_response :success
  end

  test "should update teach_course" do
    patch teach_course_url(@teach_course), params: { teach_course: { description: @teach_course.description, name: @teach_course.name, teacher_id: @teach_course.teacher_id } }
    assert_redirected_to teach_course_url(@teach_course)
  end

  test "should destroy teach_course" do
    assert_difference("Teach::Course.count", -1) do
      delete teach_course_url(@teach_course)
    end

    assert_redirected_to teach_courses_url
  end
end
