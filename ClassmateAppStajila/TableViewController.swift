//
//  TableViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/23/23.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var classmates: [Classmate]!
    
    var delegate: ClassmatesCollectionDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var ageOutlet: UITextField!
    
    @IBOutlet weak var nicknameOutlet: UITextField!
    
    @IBOutlet weak var gradeLevelPicker: UISegmentedControl!
    
    var blank = UIAlertController(title: "Error", message: "One or more of required fields are empty", preferredStyle: .alert)
    var success = UIAlertController(title: "Success", message: "A new classmate was successfully added", preferredStyle: .alert)
    var exist = UIAlertController(title: "Error", message: "This classmate is already registered", preferredStyle: .alert)
    var invalidInput = UIAlertController(title: "Invalid Input", message: "Input a whole, positive number", preferredStyle: .alert)
    var succesfullyRemoved = UIAlertController(title: "Success", message: "The student was successfuly removed from the list", preferredStyle: .alert)
    var notFound = UIAlertController(title: "Error", message: "The student is not found on the list. Would you like to add them?", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .destructive){
            alert in self.add(self)
        }
        blank.addAction(okAction)
        success.addAction(okAction)
        exist.addAction(okAction)
        invalidInput.addAction(okAction)
        succesfullyRemoved.addAction(okAction)
        notFound.addAction(noAction)
        notFound.addAction(addAction)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classmates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! ClassmateCell
        cell.name.text = classmates[indexPath.row].name
        cell.age.text = "\(classmates[indexPath.row].age)"
        cell.gradeLevel.text = classmates[indexPath.row].getLevel()
        cell.nickName.text = classmates[indexPath.row].nickname
        
        return cell
    }
    
    @IBAction func add(_ sender: Any) {
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
                    tableView.reloadData()
                    present(success, animated: true)
                    nameOutlet.text = ""
                    nicknameOutlet.text = ""
                    ageOutlet.text = ""
                    
                } else{
                   present(invalidInput, animated: true)
                }
            }else{
                present(exist, animated: true)
            }
        }else{
            present(blank, animated: true)
        }
        
        delegate.changeStudents(stu: classmates)
    }
    
    
    @IBAction func moveToTrash(_ sender: Any) {
        if findIndex(array: classmates, name: nameOutlet.text!) != -1{
            classmates.remove(at: findIndex(array: classmates, name: nameOutlet.text!))
            tableView.reloadData()
            present(succesfullyRemoved, animated: true)
        } else{
            present(notFound, animated: true)
        }
    }
    
    func isInArray(array: [Classmate], name: String) -> Bool{
        for studentName in array{
            if studentName.name.lowercased() == name.lowercased(){
                return false
            }
        }
        return true
    }
    
    func findIndex(array: [Classmate], name: String) -> Int{
        for i in 0 ..< array.count{
            if name.lowercased() == array[i].name.lowercased(){
                return i
            }
        }
        return -1
    }
}
