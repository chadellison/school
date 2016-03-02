require 'test_helper'

class TopFiveStrugglingStudentsTest < ActionDispatch::IntegrationTest
  test "when" do
    student1 = Student.create(name: "oscar", age: 23, current_score: 90)
    student2 = Student.create(name: "martha", age: 30, current_score:70)
    student3 = Student.create(name: "rosco", age: 25, current_score:83)
    student4 = Student.create(name: "bill", age: 19, current_score:67)
    student5 = Student.create(name: "jan", age: 29, current_score:23)
    student6 = Student.create(name: "chris", age: 23, current_score:15)
    student7 = Student.create(name: "jennifer", age: 25, current_score:93)

    jones = Teacher.create(name: "jones", subject: "philosophy")
    jones.students << student1
    jones.students << student2
    jones.students << student3

    jeana = Teacher.create(name: "jeana", subject: "spanish")
    jeana.students << student4
    jeana.students << student5
    jeana.students << student6
    jeana.students << student7

    visit students_path
    assert page.has_content? "chris: jeana"
    assert page.has_content? "jan: jeana"
    assert page.has_content? "bill: jeana"
    assert page.has_content? "martha: jones"
    assert page.has_content? "rosco: jones"
    refute page.has_content? "oscar: jones"
    refute page.has_content? "jennifer: jeana"
  end
end
