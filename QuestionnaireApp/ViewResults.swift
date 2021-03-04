//
//  ViewResults.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 20/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class ViewResults: UIViewController {

    //links username text field
    @IBOutlet weak var usernameTextField: UITextField!
    //links password text field
    @IBOutlet weak var passwordTextField: UITextField!
    //links "ok" button
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up a tap gesture recogniser constant
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WelcomePage.viewTapped(gestureRecognizer:)))
        //adding tapGesture to the view
        view.addGestureRecognizer(tapGesture)
    }
    
    //allows user to dismiss keyboard by tapping screen
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //declaring admin username
    let username = "admin"
    //declaring admin password
    let password = "hello"
    
    @IBAction func okButton(_ sender: Any) {
        
        //user can only view results if the username = admin and password = hello
        if usernameTextField.text == username && passwordTextField.text == password
        {
            //alert pop up if login successful
            let alertController = UIAlertController(title: "Login Successful!", message:
            "Press Ok to view the results", preferredStyle: .alert)
            //takes user to results page if login is successful and user presses OK in alert
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.performSegue(withIdentifier: "results", sender: self) } ))

            
            self.present(alertController, animated: true, completion: nil)
            //debugging code outputs to console so I can check if login successful
            NSLog("Login successful")
        }
        else
        {
            //debugging code outputs to console so I can check if login failed
            NSLog("Login failed")
            //alert pop up if login fails
            let alertController = UIAlertController(title: "Incorrect Password!", message:
            "Please enter the correct password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
