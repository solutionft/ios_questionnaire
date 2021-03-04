//
//  WelcomePage.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class WelcomePage: UIViewController {
    
    
    //links idGeneratorLabel
    @IBOutlet weak var idGeneratorLabel: UILabel!
    
    //Generates a random number up to 9999
    @IBAction func generateIdButton(_ sender: Any) {
        idGeneratorLabel.text = "\(Int(arc4random_uniform(9999)))"
    }
    
    //links id text field
    @IBOutlet weak var idTextField: UITextField!
    
    //links date of birth text field
    @IBOutlet weak var dobTextField: UITextField!
    private var datePicker: UIDatePicker?
    
    //connects to the segue identifier, moves onto next page
    @IBAction func startButton(_ sender: Any) {
        //alert pop up if login successful
        let alertController = UIAlertController(title: "Are you sure you want to continue?", message:
            "Press Yes to continue or press No to choose again.", preferredStyle: .alert)
        //takes user to q1 if they press Yes in alert
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            //saving data
            UserDefaults.standard.set(self.idTextField.text, forKey: "user_id")
            UserDefaults.standard.set(self.dobTextField.text, forKey: "user_dob")
            
            self.performSegue(withIdentifier: "start", sender: self)
        } ))
        //lets user choose another option if they press No
        alertController.addAction(UIAlertAction(title: "No", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //instance of datePicker
        datePicker = UIDatePicker()
        //setting date format from datePickerMode
        datePicker?.datePickerMode = .date
        //setting calaendar type
        let calendar = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        //user can only pick a DOB >65 years
        comps.year = -65
        let maxDate = calendar.date(byAdding: comps, to: Date())
        datePicker!.maximumDate = maxDate
        
        datePicker?.addTarget(self, action: #selector(WelcomePage.dateChanged(datePicker:)),
                              for: .valueChanged)
        
        //setting up a tap gesture recogniser constant
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WelcomePage.viewTapped(gestureRecognizer:)))
        //adding tapGesture to the view
        view.addGestureRecognizer(tapGesture)
        
        //adding the datePicker to the date of birth text field
        dobTextField.inputView = datePicker
    }
    
    //allows user to dismiss the datePicker without selecting a date when the screen is tapped
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged (datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter() //formatting the date to make it look more readable
        dateFormatter.dateFormat = "MM/dd/yyyy" //setting the date format
        dobTextField.text = dateFormatter.string(from: datePicker.date) //selects the date
        view.endEditing(true) //forces inputView to dismiss itself after selecting a date
    }
    
}
