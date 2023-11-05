//
//  InfoViewController.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 11/3/23.
//

import UIKit

class InfoViewController: UIViewController {

    var delegate: UIViewController!
    var classmate: Classmate!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var nicknameOutlet: UILabel!
    @IBOutlet weak var ageOutlet: UILabel!
    @IBOutlet weak var gradeLevel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.text = classmate.name
        nicknameOutlet.text = "Nickname: \(classmate.nickname)"
        ageOutlet.text = "Age: \(classmate.age)"
        gradeLevel.text = "Grade Level: \(classmate.getLevel())"
        
    }
    

}
