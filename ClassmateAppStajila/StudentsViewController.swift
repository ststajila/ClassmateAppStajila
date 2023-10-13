//
//  StudentsViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

class StudentsViewController: UIViewController {

    var classmates: [Classmate] = []
    @IBOutlet weak var showOutlet: UITextView!
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student Info"
        
        showOutlet.text = "Name: \(classmates[0].name)\nNickname: \(classmates[0].nickname)\nAge: \(classmates[0].age)"
    }
    
    @IBAction func sortByNameAction(_ sender: Any) {
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if i < classmates.count && i != 0{
            showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age)"
        i += 1
        } else if i == 0{
            showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
