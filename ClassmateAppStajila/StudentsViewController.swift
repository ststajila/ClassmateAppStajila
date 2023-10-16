//
//  StudentsViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import UIKit

class StudentsViewController: UIViewController {

    var delegate: ClassmatesCollectionDelegate!
    var classmates: [Classmate] = []
    @IBOutlet weak var showOutlet: UITextView!
    var i = 0
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var nicknameOutlet: UITextField!
    
    @IBOutlet weak var statusOutlet: UILabel!
    
    @IBOutlet weak var ageOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student Info"
        
        showOutlet.text = "Name: \(classmates[0].name)\nNickname: \(classmates[0].nickname)\nAge: \(classmates[0].age)"
    }
    
    @IBAction func sortByNameAction(_ sender: Any) {
        classmates.sort(by: {$0.name < $1.name})
        delegate.changeStudents(stu: classmates)
        
        i = 0
        showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age)"
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if i < classmates.count - 1{
            showOutlet.text = "Name: \(classmates[i+1].name)\nNickname: \(classmates[i+1].nickname)\nAge: \(classmates[i+1].age)"
        i += 1
        } else{
            i = 0
            showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age)"
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        if nameOutlet.text != "" && nicknameOutlet.text != "" && ageOutlet.text != ""{
            if isInArray(array: classmates, name: nameOutlet.text!) {
                if Int(ageOutlet.text!) != nil{
                    
                    classmates.append(Classmate(name: nameOutlet.text!, nickname: nicknameOutlet.text!, age: Int(ageOutlet.text!)!))
                    
                    statusOutlet.text = "A new classmate was successfully added"
                    statusOutlet.backgroundColor = UIColor.green
                    nameOutlet.text = ""
                    nicknameOutlet.text = ""
                    ageOutlet.text = ""
                    
                } else{
                    statusOutlet.text = "Input a whole, positive number"
                    statusOutlet.backgroundColor = UIColor.red
                }
            }else{
                statusOutlet.text = "This classmate is already registered"
                statusOutlet.backgroundColor = UIColor.red
            }
        }else{
            statusOutlet.text = "One or more of required fields are empty"
            statusOutlet.backgroundColor = UIColor.red
        }
        
        delegate.changeStudents(stu: classmates)
        
    }
    
    
    func isInArray(array: [Classmate], name: String) -> Bool{
        for studentName in array{
            if studentName.name.lowercased() == name.lowercased(){
                return false
            }
        }
        return true
    }
    

}
