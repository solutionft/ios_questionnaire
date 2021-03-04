//
//  PieChartVC.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 12/04/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import CoreData
class PieChartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var pieView: UIView!
    var question_arr = [String]()
    var data_array = [Data1]()

    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //question array
        question_arr = ["Have you used an iPad before?", "What is your main use of the iPad? (Select one)", "After using the iPad today how would you rate its usability?", "Would you consider using an iPad again in the future?"]
        
        
        //creating object of the core data
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        //fetch request from the entity Data1 for the saved data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        //returns all the data
        request.returnsObjectsAsFaults = false
        do {
            //store the fetch data to the data_array
            data_array = try context?.fetch(request) as! [Data1]
        } catch  {
            //error message
            print("Error, no record found")
        }
        
        //call table view method when array is not empty
        if data_array.count>0 {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell_identifier")!
        
        let lbl: UILabel = cell.viewWithTag(11) as! UILabel
        lbl.text = question_arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //pieview in the cell with tag 10
        pieView = cell.viewWithTag(10)!
        if indexPath.row == 0 {
            //set the view in the cell piechart
            let pieChart = self.setPieChart1()
            //adds piechart to cell
            cell.addSubview(pieChart)
        }
        else if indexPath.row == 1{
            //set the view in the cell piechart
            let pieChart = self.setPieChart2()
            //adds piechart to cell
            cell.addSubview(pieChart)
        }
        else if indexPath.row == 2{
            //set the view in the cell piechart
            let pieChart = self.setPieChart3()
            //adds piechart to cell
            cell.addSubview(pieChart)
        }
        else if indexPath.row == 3{
            //set the view in the cell piechart
            let pieChart = self.setPieChart4()
            //adds piechart to cell
            cell.addSubview(pieChart)
        }
    }
    
    //q1
    private func setPieChart1() -> PNPieChart {
        //counts the number of times "yes" was answered in q1
        let yes: CGFloat = CGFloat(DatabaseHelper.shareInstance.question1YES().count)
        //counts the number of times "no" was answered in q1
        let no: CGFloat = CGFloat(DatabaseHelper.shareInstance.question1NO().count)
        
        //array of total possible answers for q1
        var itemArr = [Any]()
        
        //add value if it is greater than 0
        if yes>0 {
            let item1 = PNPieChartDataItem(dateValue: yes, dateColor:  PNGreen, description: "YES")
            itemArr.append(item1)
        }
        //add value if it is greater than 0
        if no>0 {
            let item2 = PNPieChartDataItem(dateValue: no, dateColor: PNGrey, description: "NO")
            itemArr.append(item2)
        }
        
        //frame of the view (width, height, x-axis and y-axis)
        let frame = CGRect(x: pieView.frame.origin.x, y: pieView.frame.origin.y, width: pieView.frame.size.height, height: pieView.frame.size.height)
        //number of items in the chart
        let items: [PNPieChartDataItem] = itemArr as! [PNPieChartDataItem]
        //piechart with frame and number of items
        let pieChart = PNPieChart(frame: frame, items: items)
        //text colour on the chart
        pieChart.descriptionTextColor = UIColor.black
        //font type of the text on chart
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14)!
        
        return pieChart
    }
    
    //q2
    private func setPieChart2() -> PNPieChart {
        //counts the number of times "work" was answered in q2
        let work: CGFloat = CGFloat(DatabaseHelper.shareInstance.question2Work().count)
        //counts the number of times "communication/social networking" was answered in q2
        let social: CGFloat = CGFloat(DatabaseHelper.shareInstance.question2Social().count)
        //counts the number of times "internet" was answered in q2
        let internet: CGFloat = CGFloat(DatabaseHelper.shareInstance.question2Internet().count)
        //counts the number of times "games" was answered in q2
        let games: CGFloat = CGFloat(DatabaseHelper.shareInstance.question2Games().count)
        //counts the number of times "other" was answered in q2
        let other: CGFloat = CGFloat(DatabaseHelper.shareInstance.question2Other().count)

        //array of total possible answers for q2
        var itemArr = [Any]()
        
        //add value if it is greater than 0
        if work>0 {
            let item1 = PNPieChartDataItem(dateValue: work, dateColor:  PNGreen, description: "Work")
            itemArr.append(item1)
        }
        //add value if it is greater than 0
        if social>0 {
            let item2 = PNPieChartDataItem(dateValue: social, dateColor: PNGrey, description: "Social")
            itemArr.append(item2)
        }
        //add value if it is greater than 0
        if internet>0 {
            let item3 = PNPieChartDataItem(dateValue: internet, dateColor: PNBule, description: "Internet Browsing")
            itemArr.append(item3)
        }
        //add value if it is greater than 0
        if games>0 {
            let item4 = PNPieChartDataItem(dateValue: social, dateColor: PNRed, description: "Games")
            itemArr.append(item4)
        }
        //add value if it is greater than 0
        if other>0 {
            let item5 = PNPieChartDataItem(dateValue: other, dateColor: PNDarkBlue, description: "Other")
            itemArr.append(item5)
        }
        //frame of the view (width, height, x-axis and y-axis)
        let frame = CGRect(x: pieView.frame.origin.x, y: pieView.frame.origin.y, width: pieView.frame.size.height, height: pieView.frame.size.height)
        //number of items in the chart
        let items: [PNPieChartDataItem] = itemArr as! [PNPieChartDataItem]
        //piechart with frame and number of items
        let pieChart = PNPieChart(frame: frame, items: items)
        //text colour on the chart
        pieChart.descriptionTextColor = UIColor.black
        //font type of the text on chart
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14)!
        
        return pieChart
    }
    
    //q3
    private func setPieChart3() -> PNPieChart {
        //counts the number of times "very difficult" was answered in q3
        let very_difficult: CGFloat = CGFloat(DatabaseHelper.shareInstance.question3VD().count)
        //counts the number of times "difficult" was answered in q3
        let difficult: CGFloat = CGFloat(DatabaseHelper.shareInstance.question3D().count)
        //counts the number of times "very easy" was answered in q3
        let very_easy: CGFloat = CGFloat(DatabaseHelper.shareInstance.question3VE().count)
        //counts the number of times "easy" was answered in q3
        let easy: CGFloat = CGFloat(DatabaseHelper.shareInstance.question3VE().count)
        //counts the number of times "okay" was answered in q3
        let okay: CGFloat = CGFloat(DatabaseHelper.shareInstance.question3Okay().count)
        
        //array of total possible answers for q3
        var itemArr = [Any]()
        
        //add value if it is greater than 0
        if very_difficult>0 {
            let item1 = PNPieChartDataItem(dateValue: very_difficult, dateColor:  PNGreen, description: "very difficult")
            itemArr.append(item1)
        }
        //add value if it is greater than 0
        if difficult>0 {
            let item2 = PNPieChartDataItem(dateValue: difficult, dateColor: PNGrey, description: "difficult")
            itemArr.append(item2)
        }
        //add value if it is greater than 0
        if very_easy>0 {
            let item3 = PNPieChartDataItem(dateValue: very_easy, dateColor: PNBule, description: "very easy")
            itemArr.append(item3)
        }
        //add value if it is greater than 0
        if easy>0 {
            let item4 = PNPieChartDataItem(dateValue: easy, dateColor: PNRed, description: "easy")
            itemArr.append(item4)
        }
        //add value if it is greater than 0
        if okay>0 {
            let item5 = PNPieChartDataItem(dateValue: okay, dateColor: PNDarkBlue, description: "okay")
            itemArr.append(item5)
        }
        
        //frame of the view (width, height, x-axis and y-axis)
        let frame = CGRect(x: pieView.frame.origin.x, y: pieView.frame.origin.y, width: pieView.frame.size.height, height: pieView.frame.size.height)
        //number of items in the chart
        let items: [PNPieChartDataItem] = itemArr as! [PNPieChartDataItem]
        //piechart with frame and number of items
        let pieChart = PNPieChart(frame: frame, items: items)
        //text colour on the chart
        pieChart.descriptionTextColor = UIColor.black
        //font type of the text on chart
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14)!
        
        return pieChart
    }
    
    //q4
    private func setPieChart4() -> PNPieChart {
        //counts the number of times "yes" was answered in q4
        let yes: CGFloat = CGFloat(DatabaseHelper.shareInstance.question4YES().count)
        //counts the number of times "no" was answered in q4
        let no: CGFloat = CGFloat(DatabaseHelper.shareInstance.question4NO().count)
        
        //array of total possible answers for q4
        var itemArr = [Any]()
        
        //add value if it is greater than 0
        if yes>0 {
            let item1 = PNPieChartDataItem(dateValue: yes, dateColor:  PNGreen, description: "YES")
            itemArr.append(item1)
        }
        //add value if it is greater than 0
        if no>0 {
            let item2 = PNPieChartDataItem(dateValue: no, dateColor: PNGrey, description: "NO")
            itemArr.append(item2)
        }
        
        //frame of the view (width, height, x-axis and y-axis)
        let frame = CGRect(x: pieView.frame.origin.x, y: pieView.frame.origin.y, width: pieView.frame.size.height, height: pieView.frame.size.height)
        //number of items in the chart
        let items: [PNPieChartDataItem] = itemArr as! [PNPieChartDataItem]
        //piechart with frame and number of items
        let pieChart = PNPieChart(frame: frame, items: items)
        //text colour on the chart
        pieChart.descriptionTextColor = UIColor.black
        //font type of the text on chart
        pieChart.descriptionTextFont = UIFont(name: "Avenir-Medium", size: 14)!
        
        return pieChart
}
}
