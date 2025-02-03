//: [Previous](@previous)

import Foundation
protocol Grading{
    func grade(classSize: Int) -> [Int]
}
//: [Next](@next)
class Classroom : Grading {
    var students: [String] = [];
    struct Teacher{
        var name: String;
        var expertise: String;
        var experience: Int;
    }
    var currentTeacher: Teacher
    init(name: String, expertise: String, experience: Int) {
        
        self.currentTeacher = Teacher(name: name, expertise: expertise, experience: experience)
        }
    // Explicit reassigns struct
    func updateTeacher(name: String, expertise: String, experience: Int) {
        self.currentTeacher.name = name
        self.currentTeacher.expertise = expertise
        self.currentTeacher.experience = experience
    }
    func grade(classSize: Int) -> [Int] {
        var grades: [Int] = []
        for _ in 0..<classSize{
            grades.append(Int.random(in: 0...100))
        }
        return grades
    }
    func printTeacherInfo() {
        print("\(currentTeacher.name) is a \(currentTeacher.expertise) with \(currentTeacher.experience) years of experience")
    }
    func printStudents()  {
            for student in students {
            print(student)
        }
    }
}
var mathClassroom = Classroom(name: "Mr. Johnson", expertise: "Math", experience: 10)
mathClassroom.students = ["Alice", "Bob", "Charlie"]
mathClassroom.printStudents()
mathClassroom.printTeacherInfo()
mathClassroom.updateTeacher(name: "Mrs. Williams", expertise: "English", experience: 15)
mathClassroom.printTeacherInfo()

var currentGrades = mathClassroom.grade(classSize: mathClassroom.students.count)
for (index, student) in mathClassroom.students.enumerated() {
    print("\(student) has a current grade of: \(currentGrades[index])")
}

