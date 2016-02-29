require 'test_helper'

class VisitorCanSeeAllTeachersAndTheirSubjectsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "visitor can view all teachers and their subjects" do
    teacher1 = Teacher.create(name: "Jones", subject: "Philosophy")
    teacher2 = Teacher.create(name: "Harris", subject: "English")

    visit teachers_path

    assert page.has_content? "Jones: Philosophy"
    assert page.has_content? "Harris: English"
  end
end
