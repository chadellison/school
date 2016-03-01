require 'test_helper'

class VisitorCanSeeAllTeachersAndTheirSubjectsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "visitor can view all teachers and their subjects" do
    teacher1 = Teacher.create(name: "Jones", subject: "Philosophy")
    teacher2 = Teacher.create(name: "Harris", subject: "English")
    student1 = Student.create(name: "Bill")
    student2 = Student.create(name: "Frank")
    student3 = Student.create(name: "Martha")

    teacher1.students << student1
    teacher1.students << student3
    teacher2.students << student2

    visit teachers_path

    assert page.has_content? "Jones: Philosophy"
    assert page.has_content? "Bill"
    assert page.has_content? "Martha"
    assert page.has_content? "Harris: English"
    assert page.has_content? "Frank"
  end
end
