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
    
    @IBOutlet weak var classmatesCell: ClassmatesCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classmatesCell")
    }
    
    
}
