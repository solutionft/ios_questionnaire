//
//  ResultsPage.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 22/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class ResultsPage: UIViewController {
    
    //links home page button
    @IBOutlet weak var homePageButton: UIButton!
    
    //takes user back to home page
    @IBAction func homePageButton(_ sender: Any) {
        self.performSegue(withIdentifier: "resultsToHomePage", sender: self)
    }
    
    @IBAction func exitAppButton(_ sender: Any) {
        //alert pop up if login successful
        let alertController = UIAlertController(title: "Are you sure you want to exit app??", message:
            "Press Yes to exit or cancel to stay.", preferredStyle: .alert)
        //takes user to q1 if they press Yes in alert
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.performSegue(withIdentifier: "start", sender: self) } ))
        //lets user choose another option if they press No
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
