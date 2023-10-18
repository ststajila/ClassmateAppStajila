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
    @IBOutlet weak var gradeLevelPicker: UISegmentedControl!
    var i = 0
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var nicknameOutlet: UITextField!
    
    @IBOutlet weak var statusOutlet: UILabel!
    
    @IBOutlet weak var ageOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Student Info"
        
        var studentLevel = ""
        switch classmates[0].level{
        case .freshman: studentLevel = "Freshman"
        case .sophmore: studentLevel = "Sophmore"
        case .junior: studentLevel = "Junior"
        default: studentLevel = "Senior"
        }
        showOutlet.text = "Name: \(classmates[0].name)\nNickname: \(classmates[0].nickname)\nAge: \(classmates[0].age) \nGrade: \(studentLevel)"
    }
    
    @IBAction func sortByNameAction(_ sender: Any) {
        classmates.sort(by: {$0.name < $1.name})
        delegate.changeStudents(stu: classmates)
        
        i = 0
        var studentLevel = ""
        switch classmates[i].level{
        case .freshman: studentLevel = "Freshman"
        case .sophmore: studentLevel = "Sophmore"
        case .junior: studentLevel = "Junior"
        default: studentLevel = "Senior"
        }
        showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age) \nGrade: \(studentLevel)"
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if i < classmates.count - 1{
            var studentLevel = ""
            switch classmates[i+1].level{
            case .freshman: studentLevel = "Freshman"
            case .sophmore: studentLevel = "Sophmore"
            case .junior: studentLevel = "Junior"
            default: studentLevel = "Senior"
            }
            showOutlet.text = "Name: \(classmates[i+1].name)\nNickname: \(classmates[i+1].nickname)\nAge: \(classmates[i+1].age) \nGrade: \(studentLevel)"
        i += 1
        } else{
            i = 0
            var studentLevel = ""
            switch classmates[i].level{
            case .freshman: studentLevel = "Freshman"
            case .sophmore: studentLevel = "Sophmore"
            case .junior: studentLevel = "Junior"
            default: studentLevel = "Senior"
            }
            showOutlet.text = "Name: \(classmates[i].name)\nNickname: \(classmates[i].nickname)\nAge: \(classmates[i].age)\nGrade: \(studentLevel)"
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        
        if nameOutlet.text != "" && nicknameOutlet.text != "" && ageOutlet.text != ""{
            if isInArray(array: classmates, name: nameOutlet.text!) {
                if Int(ageOutlet.text!) != nil{
                    
                    var tempLevel: GradeLevel!
                    switch gradeLevelPicker.selectedSegmentIndex {
                    case 0:
                        tempLevel = .freshman
                    case 1: tempLevel = .sophmore
                    case 2: tempLevel = .junior
                    default: tempLevel = .senior
                        
                    }
                    
                        classmates.append(Classmate(name: nameOutlet.text!, nickname: nicknameOutlet.text!, age: Int(ageOutlet.text!)!, level: tempLevel))
                    
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
