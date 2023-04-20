//
//  LocationViewController.swift
//  Homework 6-Location Application
//
//  Created by Allie Lowery on 4/19/23.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var distanceLabel: UILabel!
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let kdisneyLatitude: CLLocationDegrees = 28.3772
    let kdisneyLongitude: CLLocationDegrees = -81.5707
    
   
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            let disney:CLLocation = CLLocation(latitude: kdisneyLatitude,longitude: kdisneyLongitude)
            let delta:CLLocationDistance = disney.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5
            if miles < 3 {
                locMan.stopUpdatingLocation()
                distanceLabel.text = "Enjoy\nWalt Disney World!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Walt Disney World"
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
    }
    

}
