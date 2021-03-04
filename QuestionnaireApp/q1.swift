//
//  q1.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class q1: UIViewController {
    
    //initialising answers variable for data to be passed through
    var answers: Data1?
    
    //initalises the variable that stores the answer yes or no as a string
    var storedAnswers: String!

    //button connects to the segue by using the identifier
    @IBAction func yesButton(_ sender: Any) {
        
        storedAnswers = "YES"
        //alert pop up when user presses yes
        let alertController = UIAlertController(title: "Are you sure you want to continue?", message: "Press Yes to continue or press No to choose again.", preferredStyle: .alert)
        //takes user to q2 if they press Yes in alert
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.performSegue(withIdentifier: "yes", sender: self) } ))
        //lets user choose another option if they press No
        alertController.addAction(UIAlertAction(title: "No", style: .default))
        //shows the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    //button connects to the segue by using the identifier
    @IBAction func noButton(_ sender: Any) {
        
        storedAnswers = "NO"
        //alert pop up when user presses no
        let alertController = UIAlertController(title: "Are you sure you want to continue?", message: "Press Yes to continue or press No to choose again.", preferredStyle: .alert)
        //takes user to q3 if they press Yes in alert
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.performSegue(withIdentifier: "no", sender: self) } ))
        //lets user choose another option if they press No
        alertController.addAction(UIAlertAction(title: "No", style: .default))
        //shows the alert
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(answers?.id)
        print(answers?.dob)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //declaring segueIdentifier
        let segueIdentifier = segue.identifier
        
        //saving answer
        UserDefaults.standard.set(storedAnswers, forKey: "q1")
        
        //passes data if user presses yes button
        if(segueIdentifier == "yes")
        {
            //prints to console when passing data
            print("passing user")
            //saving answers inside the storedAnswers variable as a string
            self.answers?.q1 = self.storedAnswers
            //passes data to segue
            let destinationVC = segue.destination as! q2
            //passing answers to the destination, which is the segue
            destinationVC.answers=self.answers}
        
        //passes data if user presses yes button
        else{(segueIdentifier == "no")
            do {
                //prints to console when passing data
                print("passing user")
                //saving answers inside the storedAnswers variable as a string
                self.answers?.q1 = self.storedAnswers
                //passes data to segue
                let destinationVC = segue.destination as! q3
                //passing answers to the destination, which is the segue
                destinationVC.answers=self.answers
            }
        }
    }

}
