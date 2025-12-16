require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "should be valid with all attributes" do
    course = Course.new(
      name: "Test Course",
      code: "TEST101",
      credits: 3,
      semester: "Fall 2025",
      description: "A test course"
    )
    assert course.valid?
  end

  test "should require name" do
    course = Course.new(code: "TEST101", credits: 3, semester: "Fall 2025")
    assert_not course.valid?
    assert_includes course.errors[:name], "can't be blank"
  end

  test "should require code" do
    course = Course.new(name: "Test Course", credits: 3, semester: "Fall 2025")
    assert_not course.valid?
    assert_includes course.errors[:code], "can't be blank"
  end

  test "should require semester for custom courses" do
    course = Course.new(name: "Custom Course", code: "CUS101", credits: 3, custom: true)
    assert_not course.valid?
    assert_includes course.errors[:semester], "can't be blank"
  end

  test "should have unique code" do
    existing_course = courses(:one)
    course = Course.new(
      name: "Another Course",
      code: existing_course.code,
      credits: 3,
      semester: "Fall 2025"
    )
    assert_not course.valid?
    assert_includes course.errors[:code], "has already been taken"
  end

  test "should have default custom as false" do
    course = Course.new(name: "Test Course", code: "TEST101")
    assert_not course.custom?
  end

  test "should allow custom courses" do
    course = Course.new(
      name: "Custom Course",
      code: "CUS101",
      credits: 3,
      semester: "Fall 2025",
      custom: true
    )
    assert course.valid?
    assert course.custom?
  end

  test "should have many enrollments" do
    course = courses(:one)
    assert_respond_to course, :enrollments
  end

  test "should have many users through enrollments" do
    course = courses(:one)
    assert_respond_to course, :users
  end
end
