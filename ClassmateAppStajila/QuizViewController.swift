//
//  QuizViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var Q1: UILabel!
    @IBOutlet weak var Q2: UILabel!
    @IBOutlet weak var Q3: UILabel!
    @IBOutlet weak var q1Outlet: UITextField!
    @IBOutlet weak var q2Outlet: UITextField!
    @IBOutlet weak var q3Outlet: UITextField!
    var q1: Int!
    var q2: Int!
    var q3: Int!
    var grade = 0
    @IBOutlet weak var gradeLabel: UILabel!
    
    var classmatesArray: [Classmate]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quiz"
        // Do any additional setup after loading the view.
        if createQuiz() {
            Q1.text = "What nickname does \(classmatesArray[q1].name)"
            Q2.text = "What nickname does \(classmatesArray[q2].name)"
            Q3.text = "What nickname does \(classmatesArray[q3].name)"
        }
    }
    
    func createQuiz () -> Bool{
        q1 = Int.random(in: 0..<classmatesArray.count)
            q2 = Int.random(in: 0..<classmatesArray.count)
            q3 = Int.random(in: 0..<classmatesArray.count)
            while q2 == q1{
                q2 = Int.random(in: 0..<classmatesArray.count)
            }
            while q3 == q1 || q3 == q2{
                q3 = Int.random(in: 0..<classmatesArray.count)
            }
        return true
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        grade = 0
        
        if q1Outlet.text!.lowercased() == classmatesArray[q1].nickname.lowercased(){
            grade += 1
        }
        if q2Outlet.text!.lowercased() == classmatesArray[q2].nickname.lowercased(){
            grade += 1
        }
        if q3Outlet.text!.lowercased() == classmatesArray[q3].nickname.lowercased(){
            grade += 1
        }
        
        gradeLabel.text = "You got \(grade) out of 3"
    }

}
