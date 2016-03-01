require 'test_helper'

class UserSeesOldestAndYoungestStudentTest < ActionDispatch::IntegrationTest
  test "user sees oldest and youngest student on roster" do
    rosco = Student.create(name: "rosco", age: 20)
    margret = Student.create(name: "margret", age: 17)
    marko = Student.create(name: "marko", age: 27)

    teacher = Teacher.create(name: "jones", subject: "philosophy")

    [rosco, margret, marko].each { |student| teacher.students << student }

    visit teachers_path
    assert page.has_content?(17)
    assert page.has_content?(27)
    refute page.has_content?(20)
  end
end
