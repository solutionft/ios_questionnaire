//
//  MapVC.swift
//  QuestionnaireApp
//
//  Created by Adnan Hussain on 12/04/2019.
//  Copyright © 2019 Adnan Hussain. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //map object
    @IBOutlet var mapView: MKMapView!
    
    //location array of user who has completed the questionnaire
    var location_arr = [Data1]()
    var locationMngr: CLLocationManager!
    var lat: Double?
    var lon: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //location is the last place of the user
        let location: CLLocation = locations.last!
        lat = location.coordinate.latitude
        lon = location.coordinate.longitude
        //stops updating user location
        locationMngr.stopUpdatingLocation()
        self.map_view()
    }
    
    func map_view() {
        //defining map type as there are three map types in IOS
        mapView.mapType = MKMapType.standard
        //current location will show when map is opened
        let location = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        //defining width and height of the map
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //region is made from the location, width and height of the map
        let region = MKCoordinateRegion(center: location, span: span)
        //sets the region on the map
        mapView.setRegion(region, animated: true)
        
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data1")
        request.returnsObjectsAsFaults = false
        do {
            location_arr = try context?.fetch(request) as! [Data1]
            //annotation is added when location array is fetched
            self.addAnnotation()
        } catch  {
            //error message
            print("Error, no record found")
        }
    }
    
    func addAnnotation() {
        //iterate through the location array and take the latitude and logitude from the array then show annotation on the map according to values
        for item in location_arr {
            //latitude of the item
            let pointLat = item.latitude
            //longitude of the item
            let pointLon = item.longitude
            //location of the cooridate(lat, long)
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(pointLat), longitude: CLLocationDegrees(pointLon))
            //initiate annotation object
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            //assign coordinate to the annotation
            myAnnotation.coordinate = location
            //adds annotation to the map
            mapView.addAnnotation(myAnnotation)
        }
    }
    
    //this method is called whenever an annotation is added to the map
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //if the annotation is of user current location then return nil
        if annotation is MKUserLocation{
            return nil;
        }
        //if annotation is not users current location annotation
        else{
            let pinIdent = "Pin";
            var pinView: MKPinAnnotationView;
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation;
                pinView = dequeuedView;
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
            }
            return pinView;
        }
    }
}
