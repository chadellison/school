require 'test_helper'

class UserCreatesTeacherTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test "the truth" do
    visit root_path
    click_on "Add Teacher"
    fill_in "Name", with: "Jones"
    fill_in "Subject",with: "Philosophy"
    click_on "Submit"

    teacher = Teacher.last
    assert_equal teacher_path(teacher), current_path
    assert page.has_content? "Jones added!"

    assert page.has_content? "Teacher: Jones"
    assert page.has_content? "Subject: Philosophy"

  end
end
