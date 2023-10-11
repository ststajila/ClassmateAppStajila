//
//  ViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var student1 = Classmate(name: "Stanislav", nickname: "Swimislav", age: 17)
    var student2 = Classmate(name: "Miles", nickname: <#T##String#>, age: <#T##Int#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view.
    }

    @IBAction func studentInfoAction(_ sender: Any) {
        
        performSegue(withIdentifier: "studentInfoScreen", sender: self)
        
    }
    
    @IBAction func QuizAction(_ sender: Any) {
        performSegue(withIdentifier: "quizScreen", sender: self)
    }
}

