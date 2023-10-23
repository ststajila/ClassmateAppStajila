//
//  ViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

protocol ClassmatesCollectionDelegate {
    func changeStudents(stu: [Classmate])
}

class ViewController: UIViewController, ClassmatesCollectionDelegate {
    
    var student1 = Classmate(name: "Stanislav", nickname: "Swimi", age: 17, level: .senior)
    var student2 = Classmate(name: "Miles", nickname: "Mile", age: 17, level: .junior)
    var student3 = Classmate(name: "Andrew", nickname: "All about me", age: 17, level: .junior)
    var students: [Classmate] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        students.append(student1)
        students.append(student2)
        students.append(student3)
        // Do any additional setup after loading the view.
    }

    @IBAction func studentInfoAction(_ sender: Any) {
        
        performSegue(withIdentifier: "studentInfoScreen", sender: self)
        
    }
    
    @IBAction func QuizAction(_ sender: Any) {
        performSegue(withIdentifier: "quizScreen", sender: self)
    }
    
    
    @IBAction func tableViewAction(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentInfoScreen"{
            let nvc = segue.destination as! StudentsViewController
            nvc.delegate = self
            nvc.classmates = students
        }else if segue.identifier == "quizScreen"{
            let nvc = segue.destination as! QuizViewController
            nvc.classmatesArray = students
        } else{
            let nvc =  segue.destination as! TableViewController
            nvc.classmates = students
        }
        
    }
    
    func changeStudents(stu: [Classmate]) {
        students = stu
    }
}

