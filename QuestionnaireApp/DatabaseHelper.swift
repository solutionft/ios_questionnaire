//
//  DatabaseHelper.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 12/04/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper {
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //q1
    func question1YES() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q1 = 'YES'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question1NO() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q1 = 'NO'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    //q2
    func question2Work() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q2 = 'WORK'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question2Social() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q2 = 'COMMUNICATION/SOCIAL NETWORKING'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question2Internet() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q2 = 'INTERNET BROWSING'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question2Games() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q2 = 'GAMES'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question2Other() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q2 = 'OTHER'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }

    //q3
    func question3VD() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q3 = 'VERY DIFFICULT'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question3D() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q3 = 'DIFFICULT'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question3VE() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q3 = 'VERY EASY'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question3E() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q3 = 'EASY'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question3Okay() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q3 = 'OKAY'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    
    //q4
    func question4YES() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q4 = 'YES'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
    
    func question4NO() -> [Data1]{
        var arr = [Data1]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.predicate = NSPredicate.init(format: "q4 = 'NO'")
        request.returnsObjectsAsFaults = false
        do {
            arr = try context?.fetch(request) as! [Data1]
        } catch  {
            print("no record found")
        }
        return arr
    }
}
