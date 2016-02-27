require 'test_helper'

class UserCreatesTeacherTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test "the truth" do
    # when i visit the home page
    visit root_path
    # and i click on "add teacher"
    click_on "Add Teacher"
    # and i fill in the teacher's name
    fill_in "Name", with: "Jones"
    # and i fill in the teacher's subject
    fill_in "Subject",with: "Philosophy"
    # and i click submit
    click_on "Submit"

    teacher = Teacher.last
    # then i should be on the teacher show page
    assert_equal teacher_path(teacher), current_path
    # and i should see a message "NAME added"
    assert page.has_content? "Jones added!"

    assert page.has_content? "Teacher: Jones"
    # and i should see the teacher's subject
    assert page.has_content? "Subject: Philosophy"

  end
end
