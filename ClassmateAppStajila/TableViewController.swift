//
//  TableViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/23/23.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var classmates: [Classmate]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
    
    
}
