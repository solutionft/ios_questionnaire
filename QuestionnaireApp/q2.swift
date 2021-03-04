//
//  q2.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class q2: UIViewController {
    
    //initialising answers variable for data to be passed through
    var answers: Data1?
    
    //initalises the variable that stores the answer yes or no as a string
    var storedAnswers: String!

    //button connects to the segue by using the identifier
    @IBAction func workButton(_ sender: Any) {
        storedAnswers = "WORK"
        performSegue(withIdentifier: "mainUse", sender: self)
    }
    
    //button connects to the segue by using the identifier
    @IBAction func internetBrowsing(_ sender: Any) {
        storedAnswers = "INTERNET BROWSING"
        performSegue(withIdentifier: "mainUse", sender: self)
    }
    
    //button connects to the segue by using the identifier
    @IBAction func otherButton(_ sender: Any) {
        storedAnswers = "OTHER"
        performSegue(withIdentifier: "mainUse", sender: self)
    }
    
    //button connects to the segue by using the identifier
    @IBAction func gamesButton(_ sender: Any) {
        storedAnswers = "GAMES"
        performSegue(withIdentifier: "mainUse", sender: self)
    }
    
    //button connects to the segue by using the identifier
    @IBAction func communicationButton(_ sender: Any) {
        storedAnswers = "COMMUNICATION/SOCIAL NETWORKING"
        performSegue(withIdentifier: "mainUse", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(answers?.q1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //saving answer
        UserDefaults.standard.set("q2", forKey: "question_check")
        UserDefaults.standard.set(storedAnswers, forKey: "q2")
        
        //declaring segueIdentifier
        let segueIdentifier = segue.identifier
        
        print(segueIdentifier)
        
        if(segueIdentifier == "mainUse")
        {
            //prints to console when passing data
            print("passing user")
            print(answers.self)
            //saving answers inside the storedAnswers variable as a string
            self.answers?.q2 = self.storedAnswers
            //passes data to segue
            let destinationVC = segue.destination as! q4
            //passing answers to the destination, which is the segue
            destinationVC.answers = self.answers
        }
    }
}
