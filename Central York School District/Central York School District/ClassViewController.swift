//
//  ClassViewController.swift
//  Central York School District
//
//  Created by Alex Santarelli on 6/5/15.
//  Copyright (c) 2015 Alex Santarelli. All rights reserved.
//

import UIKit
import Foundation
import Parse

class Student {
    let username:String
    var studentObjID:String
    
    init(username:String, studentObjID:String) {
        self.username = username
        self.studentObjID = studentObjID
    }
}

class ClassViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //This will be under the method where it queries for the student based on the name.
        let currentStudent = Student(username: "ParseUsername", studentObjID: "ParseUserObjectID")
        
        let studentQuery = PFQuery(className: "StudentName")
        studentQuery.countObjectsInBackgroundWithBlock(<#block: PFIntegerResultBlock?##(Int32, NSError?) -> Void#>)
        
    }
}
