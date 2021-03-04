//
//  q3.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 19/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class q3: UIViewController {
    
    //initialising answers variable for data to be passed through
    var answers: Data1?
    
    //links sliderLabel
    @IBOutlet weak var sliderLabel: UILabel!

    //links sliderOutlet
    @IBOutlet weak var sliderOutlet: UISlider!
    
    //creates action
    @IBAction func usabilitySlider(_ sender: UISlider) {
        sliderOutlet.value = roundf(sliderOutlet.value)
        sliderLabel.text = "OKAY"
        if
            sliderOutlet.value == Float(Int(1))
        {
            sliderLabel.text = "VERY DIFFICULT"
        }
        else if
            sliderOutlet.value == Float(Int(2)){
            sliderLabel.text = "DIFFICULT"
        }
        else if
            sliderOutlet.value == Float(Int(3)){
            sliderLabel.text = "OKAY"
        }
        else if
            sliderOutlet.value == Float(Int(4)){
            sliderLabel.text = "EASY"
        }
        else if
            sliderOutlet.value == Float(Int(5)){
            sliderLabel.text = "VERY EASY"
        }

    }

    //button connects to the segue using the identifier, takes user to next page
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "rateUsability", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(answers?.q1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //saving answer
        UserDefaults.standard.set("q3", forKey: "question_check")
        UserDefaults.standard.set(sliderLabel.text, forKey: "q3")
        
        //declaring segueIdentifier
        let segueIdentifier = segue.identifier
        
        print(segueIdentifier)
        
        if(segueIdentifier == "rateUsability")
        {
            //prints to console when passing data
            print("passing user")
            print(answers.self)
            
            self.answers?.q3 = self.sliderLabel.text
            //passes data to segue
            let destinationVC = segue.destination as! q4
            //passing answers to the destination, which is the segue
            destinationVC.answers = self.answers
        }
        
    }

}
