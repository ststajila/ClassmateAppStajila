//
//  Classmate.swift
//  ClassmateAppStajila
//
//  Created by STANISLAV STAJILA on 10/11/23.
//

import Foundation
enum GradeLevel{
    case freshman, sophmore, junior, senior
}

class Classmate{
    var name: String
    var nickname: String
    var age: Int
    var level: GradeLevel
    
    init(name: String, nickname: String, age: Int, level: GradeLevel) {
        self.name = name
        self.nickname = nickname
        self.age = age
        self.level = level
    }
}
