//
//  ViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var student1 = Classmate(name: "Stanislav", nickname: "Swimi", age: 17)
    var student2 = Classmate(name: "Miles", nickname: "Mile", age: 17)
    var student3 = Classmate(name: "Andrew", nickname: "All about me", age: 17)
    var students: [Classmate]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
//        students.append(student1)
//        students.append(student2)
//        students.append(student3)
        // Do any additional setup after loading the view.
    }

    @IBAction func studentInfoAction(_ sender: Any) {
        
        performSegue(withIdentifier: "studentInfoScreen", sender: self)
        
    }
    
    @IBAction func QuizAction(_ sender: Any) {
        performSegue(withIdentifier: "quizScreen", sender: self)
    }
}

