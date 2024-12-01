require "application_system_test_case"

class Teach::CoursesTest < ApplicationSystemTestCase
  setup do
    @teach_course = teach_courses(:one)
  end

  test "visiting the index" do
    visit teach_courses_url
    assert_selector "h1", text: "Courses"
  end

  test "should create course" do
    visit teach_courses_url
    click_on "New course"

    fill_in "Description", with: @teach_course.description
    fill_in "Name", with: @teach_course.name
    fill_in "Teacher", with: @teach_course.teacher_id
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update Course" do
    visit teach_course_url(@teach_course)
    click_on "Edit this course", match: :first

    fill_in "Description", with: @teach_course.description
    fill_in "Name", with: @teach_course.name
    fill_in "Teacher", with: @teach_course.teacher_id
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "should destroy Course" do
    visit teach_course_url(@teach_course)
    click_on "Destroy this course", match: :first

    assert_text "Course was successfully destroyed"
  end
end
