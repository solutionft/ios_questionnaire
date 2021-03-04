//
//  TableViewResult.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 14/04/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData

class TableViewResult: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    var data_array = [Data1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting tableview delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        //creating object of the core data
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        //fetch request from the entity Data1 for the saved data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        //return all the data
        request.returnsObjectsAsFaults = false
        do {
            //store the fetch data to the data_array
            data_array = try context?.fetch(request) as! [Data1]
        } catch  {
            //error message
            print("Error, no records found")
        }
        
        //reload tableview when data is fetched
        tableView.reloadData()
        print(data_array.count)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //initiating taleview cell object
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell_identifier", for: indexPath)
        //assigning a tag to each label
        let lbl1: UILabel = cell.viewWithTag(1) as! UILabel
        let lbl2: UILabel = cell.viewWithTag(2) as! UILabel
        let lbl3: UILabel = cell.viewWithTag(3) as! UILabel
        let lbl4: UILabel = cell.viewWithTag(4) as! UILabel
        let lbl5: UILabel = cell.viewWithTag(5) as! UILabel
        let lbl6: UILabel = cell.viewWithTag(6) as! UILabel
        
        //assigning the value from the array to the label
        lbl1.text = data_array[indexPath.row].id
        lbl2.text = data_array[indexPath.row].dob
        lbl3.text = data_array[indexPath.row].q1
        lbl4.text = data_array[indexPath.row].q2
        lbl5.text = data_array[indexPath.row].q3
        lbl6.text = data_array[indexPath.row].q4
        return cell
    }
}
