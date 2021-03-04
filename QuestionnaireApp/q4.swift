//
//  q4.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData


class q4: UIViewController {
    
    //initialising answers variable for data to be passed through
    var answers: Data1?
    
    //initalises the variable that stores the answer yes or no as a string
    var storedAnswers: String!

    @IBAction func yesButton(_ sender: Any) {
        storedAnswers = "YES"
        performSegue(withIdentifier: "finalPage", sender: self)
    }
    
    @IBAction func noButton(_ sender: Any) {
        storedAnswers = "NO"
        performSegue(withIdentifier: "finalPage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(answers?.q3)
        print(answers?.q3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //saving answers
        UserDefaults.standard.set(storedAnswers, forKey: "q4")
        
        //declaring segueIdentifier
        let segueIdentifier = segue.identifier

        if(segueIdentifier == "finalPage")
        {
            //saving answers inside the storedAnswers variable as a string
            self.answers?.q4 = self.storedAnswers
            print(answers.self)
            //prints to console when passing data
            print("passing user")
            //passes data to segue
            let destinationVC = segue.destination as! finalPage
            //passing answers to the destination, which is the segue
            destinationVC.answers=self.answers
        }
    }
}
