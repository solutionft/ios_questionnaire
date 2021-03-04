//
//  ViewController.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //initialising asnwers variable for data to be passed through
    var answers: Data?
    
    //initalises the variable that stores the answer yes or no as a string
    var storedAnswers: String!

    //connects to the segue identifier, moves onto next page
    @IBAction func enterButton(_ sender: Any) {
        performSegue(withIdentifier: "enter", sender: self)
    }
    
    //connects to the segue identifier, moves onto admin login page
    @IBAction func adminButton(_ sender: Any) {
        performSegue(withIdentifier: "viewResults", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
