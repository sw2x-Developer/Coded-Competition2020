//
//  ViewController.swift
//  GimmeFood
//
//  Created by Sw2x on 3/24/20.
//  Copyright © 2020 Sw2x. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var zaButton: CustomButton!
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        zaButton.setTitle("Please Wait ...", for: .normal)
        zaButton.isEnabled = false
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
    }
    
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            mapView.mapType = MKMapType.standard
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "You"
            annotation.subtitle = "current location"
            mapView.addAnnotation(annotation)
           
            let url = URL(string: "https://vendors.talabat.com/api/v2/vendors/\(location.latitude)/\(location.longitude)")
                       guard let requestUrl = url else { fatalError() }
                       var request = URLRequest(url: requestUrl)
                       request.httpMethod = "GET"
                       let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                                         
                    
                       if let data = data, let dataString = String(data: data, encoding: .utf8) {
                           
                        do {
                            // "dls":"Close"
                                 
                                         let regex = try NSRegularExpression(pattern: "\"lg\":\"(.*?)\"", options: NSRegularExpression.Options.caseInsensitive)
                                         let regex2 = try NSRegularExpression(pattern: "\"bna\":\"(.*?)\"", options: .caseInsensitive)
                                         let regex3 = try NSRegularExpression(pattern: "\"dls\":\"(.*?)\"" , options: .caseInsensitive)
                                         let matches = regex.matches(in: dataString, options: [], range: NSRange(location: 0, length: dataString.utf16.count))
                                         let matches2 = regex2.matches(in: dataString, options: [], range: NSRange(location: 0, length: dataString.utf16.count))
                                         let matches3 = regex3.matches(in: dataString, options: [], range: NSRange(location: 0 , length: dataString.utf16.count))
                                         for (match1 , (match2 , match3)) in zip(matches , zip(matches2 , matches3)) {
                                             let range1 = match1.range(at:1)
                                             let range2 = match2.range(at:1)
                                             let range3 = match3.range(at:1)
                                             if let swiftRange1 = Range(range1, in: dataString), let swiftRange2 = Range(range2 , in: dataString) , let swiftRange3 = Range(range3 , in: dataString) {
                                             let imgurl = dataString[swiftRange1]
                                             let name = dataString[swiftRange2]
                                             let status = dataString[swiftRange3]
                                                       print("NAME: \(name) | Image URL : \(imgurl) | Status: \(status)" )
                                                        //  let restu = Resturant.init(name: String(name), Image: UIImage.downloadfromurl(url:) , status: "Open")
                                                let restu = Resturant.init(name: String(name), ImageURL: "https://images.deliveryhero.io/image/talabat/restaurants/\(String(imgurl))", Image: UIImage(), status: String(status))
                                               arrayOfResturants.append(restu)
                                           
                                              
                                                          
                                             
                                         }
                                         }
                          
                           
                           
                                         } catch {
                                       
                                     }
                           
                        
                        DispatchQueue.main.async {
                                  self.zaButton.setTitle("🍔🍔🍔", for: .normal)
                                              self.zaButton.isEnabled = true
                        }
                  
                       
                         }
                                                  
                          }
                                              
                             task.resume()
            
            
            
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
            mapView.view(for: mapView.userLocation)?.isHidden = true
                      
        }
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            String.popAlert(presenter: self, Title: "Turn on location Services", message: "To use this feature you have to turn on location Services from Settings")
        }
    }
    
 
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            String.popAlert(presenter: self, Title: "Allow permission", message: "To use this app you have to allow permission" , what: {_ in
                exit(0)
            })
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    @IBAction func ButtonTouch(_ sender: Any) {
         self.showSpinner(onView: self.view)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
//        for i in counter ..< counter + 25 {
//            arrayOfResturants[i].Image = UIImage.downloadfromurl(url: arrayOfResturants[i].ImageURL)
//                   temparrayofResturants.append(arrayOfResturants[i])
//           }
//
//               counter += 25
        
    }

}

extension ViewController: CLLocationManagerDelegate ,MKMapViewDelegate {
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
//        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
//        mapView.setRegion(region, animated: true)
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mapView.mapType = MKMapType.standard

                let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "You"
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)
        mapView.view(for: mapView.userLocation)?.isHidden = true

        lat = Double(location.coordinate.latitude)
        long = Double(location.coordinate.longitude)
        
        
           
           
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension String {
    static func popAlert(presenter: UIViewController, Title: String , message: String, what: @escaping (UIAlertAction) -> Void = {_ in })
    {
        let alertController = UIAlertController(title: Title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: what)
        alertController.addAction(okAction)
        presenter.present(alertController, animated: true)
    }
}
