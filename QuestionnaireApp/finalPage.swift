//
//  finalPage.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 26/03/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class finalPage: UIViewController, CLLocationManagerDelegate {
    
    //initialising location
    let locationManager = CLLocationManager()
    
    //initialising answers variable for data to be passed through
    var answers: Data1?
    
    var locationMngr: CLLocationManager!
    
    //links idResult button
    @IBOutlet weak var idResult: UILabel!
    
    //links dobResult button
    @IBOutlet weak var dobResult: UILabel!
    
    //links question 1 button
    @IBOutlet weak var q1Result: UILabel!
    
    //links question 2 button
    @IBOutlet weak var q2Result: UILabel!
    
    //links question 3 button
    @IBOutlet weak var q3Result: UILabel!
    
    //links question 4 button
    @IBOutlet weak var q4Result: UILabel!
    
    //links longitude button
    @IBOutlet weak var longitudeTextField: UILabel!
    
    //links latitude button
    @IBOutlet weak var latitudeTextField: UILabel!
    
    var count: Int!
    var lat: Float!
    var lon: Float!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if count == 0 {
            //location is the last place of the user
            let location: CLLocation = locations.last!
            //converting latitude and longitude from float to string
            latitudeTextField.text = String(format: "%f", location.coordinate.latitude)
            longitudeTextField.text = String(format: "%f", location.coordinate.longitude)
            lat = Float(location.coordinate.latitude)
            lon = Float(location.coordinate.longitude)
            //stops updating user location
            locationMngr.stopUpdatingLocation()
            //saves latitude and longitude
            self.save()
        }
        count = count+1
        print("location saved")
    }
    
    func save() {
        //creating object of the core data
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        //creating object of entity Data1
        let obj: Data1 = NSEntityDescription.insertNewObject(forEntityName: "Data1", into: context!) as! Data1
        //accessing the user_id, user_dob and all questions through userdefault and assigning properties
            obj.id = UserDefaults.standard.value(forKey: "user_id") as? String
            obj.dob = UserDefaults.standard.value(forKey: "user_dob") as? String
            obj.q1 = UserDefaults.standard.value(forKey: "q1") as? String
            obj.q2 = UserDefaults.standard.value(forKey: "q2") as? String
            obj.q3 = UserDefaults.standard.value(forKey: "q3") as? String
            obj.q4 = UserDefaults.standard.value(forKey: "q4") as? String
            obj.latitude = lat
            obj.longitude = lon
            do {
                //data saved to core data and success message will print to console
                print("data saved successfully!")
                try context?.save()
            } catch {
                //error message prints to console if save to core dara fails
                print("data save failed")
            }
        
        //removing UserDefaults value
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "user_dob")
        UserDefaults.standard.removeObject(forKey: "q1")
        UserDefaults.standard.removeObject(forKey: "q2")
        UserDefaults.standard.removeObject(forKey: "q3")
        UserDefaults.standard.removeObject(forKey: "q4")
    }
    
    //takes user back to homepage
    @IBAction func homePageButton(_ sender: Any) {
        performSegue(withIdentifier:"resultsToHomePage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        //initiate location manager object
        locationMngr = CLLocationManager()
        //set delegate so that the deleagte method can be called
        locationMngr.delegate = self
        //setting desired accuracy
        locationMngr.desiredAccuracy = kCLLocationAccuracyBest
        //asking for user permission to use map in the app
        locationMngr.requestWhenInUseAuthorization()
        //start updating user location
        locationMngr.startUpdatingLocation()
        
        //assigning the value to the labels
        idResult.text = UserDefaults.standard.value(forKey: "user_id") as? String
        dobResult.text = UserDefaults.standard.value(forKey: "user_dob") as? String
        q1Result.text = UserDefaults.standard.value(forKey: "q1") as? String
        q4Result.text = UserDefaults.standard.value(forKey: "q4") as? String
        
        let str: String = UserDefaults.standard.value(forKey: "question_check") as! String
        //if user selected q2 then assign value to q2result label
        if str == "q2" {
            q2Result.text = UserDefaults.standard.value(forKey: "q2") as? String
        }
        //if user selected q3 then assign value to q3result label
        else if str == "q3"{
            q3Result.text = UserDefaults.standard.value(forKey: "q3") as? String
        }
    }
    
    // 2 Print Error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //declaring segueIdentifier
        let segueIdentifier = segue.identifier

        if(segueIdentifier == "resultsToHomePage")
        {
            //prints to console when passing data
            print("passing user")
            print(answers.self)
            //passes data to segue
            let destinationVC = segue.destination as! ViewController
        }
    }
    
    //location function
    func getLocation() {
        
        let status = CLLocationManager.authorizationStatus()
        switch status {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return
            
        case .denied, .restricted:
            let alert = UIAlertController(title: "Location services disabled", message: "Please enable location services in settings", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present (alert, animated: true, completion: nil)
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    //links share button
    @IBAction func shareBtn(_ sender: Any) {
        let exportStr: String = createExportString()
        self.saveAndExport(exportString: exportStr)
    }
    
    func createExportString() -> String {
        
        //dictionary of all values
        let dict: [String: Any] = ["question1": q1Result.text!, "question2": q2Result.text!, "question3": q3Result.text!, "question4": q4Result.text!, "lat": lat!, "long": lon!, "user_id": idResult.text!, "user_dob": dobResult.text!]
        
        var user_id : String?
        var user_dob : String?
        var question1 : String?
        var question2 : String?
        var question3 : String?
        var question4 : String?
        var latitude : Float?
        var longitude : Float?
        
        //data will be exported in this format
        var export : String = NSLocalizedString("user_id, user_dob, question1, question2, question3, question4, latitude, longitude \n", comment: "")
        
        //assigning value from the above dictionary to these variables
        user_id = dict["user_id"] as? String
        user_dob = dict["user_dob"] as? String
        question1 = dict["question1"] as? String
        question2 = dict["question2"] as? String
        question3 = dict["question3"] as? String
        question4 = dict["question4"] as? String
        latitude = dict["lat"] as? Float
        longitude = dict["long"] as? Float
        
        //concatenating all the values to one value
        let str1 = user_id! + "," + user_dob! + ","
        let str2 = question1! + "," + question2! + ","
        let str3 = question3! + "," + question4! + ","
        let str4 = String(format: "%f", latitude!) + "," + String(format: "%f", longitude!) +  "\n"
        let str5 = str1 + str2
        let str6 = str3 + str4
        export += str5 + str6
        //return the string which is made from the variable concatenation
        return export
    }

    func saveAndExport(exportString: String) {
        //the exported file will be added to this path
        let exportFilePath = NSTemporaryDirectory() + "export.csv"
        //changing file location from path object to url object
        let exportFileURL = NSURL(fileURLWithPath: exportFilePath)
        //creating the file
        FileManager.default.createFile(atPath: exportFilePath, contents: NSData() as Data, attributes: nil)
        // error message
        var fileHandleError: NSError? = nil
        //this object handles the file
        var fileHandle: FileHandle? = nil
        do {
            //fileHandle object is initiated
            fileHandle = try FileHandle(forWritingTo: exportFileURL as URL)
        } catch {
            //prints error message
            print("Error with fileHandle")
        }
        
        //if there is no error in the above do catch then filehandle will be not nil and the following if condtion will be executed
        if fileHandle != nil {
            fileHandle!.seekToEndOfFile()
            //creating the CSV file
            let csvData = exportString.data(using: String.Encoding.utf8, allowLossyConversion: false)
            //writing the created file to the specified url
            fileHandle!.write(csvData!)
            
            //closing the file handle after saving
            fileHandle!.closeFile()
            
            //accessing the CSV file from the path it is saved to
            let firstActivityItem = NSURL(fileURLWithPath: exportFilePath)
            print(firstActivityItem)
            //initiating the activityVC object so that the CSV file can be shared
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [firstActivityItem], applicationActivities: nil)
            
            //exclude the activity type from the sharing list
            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo
            ]
            //presenting the activity VC
            present(activityViewController, animated: true, completion: nil)
            if let popOver = activityViewController.popoverPresentationController {
                popOver.sourceView = self.view
            }
        }
    }
}
