//
//  HomeViewController.swift
//  TravelHistory
//
//  Created by Vishnuvarthan Deivendiran on 15/08/21.
//

import UIKit
import CoreLocation

class RestaurantViewController: UIViewController {
    
    var viewModel = HomeViewModel()
    @IBOutlet weak var restaurantTableView: UITableView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restaurantTableView.register(UINib(nibName:"RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantTableViewCell")
        self.restaurantTableView.rowHeight = UITableView.automaticDimension
        self.viewModel.delegate = self
        self.determineMyCurrentLocation()
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.requestLocation()
    }
    
}


extension RestaurantViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //self.locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        self.viewModel.GetNearbyRestaturantDetailsAPICall(latitude: userLocation.coordinate.longitude, longitude: userLocation.coordinate.latitude, onSuccess: { msg, status in
            self.restaurantTableView.reloadData()
        }, onFailure: { msg in
            self.showAlertView(message: msg, action: true)
        })
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print("Error \(error)")
    }

}
 
extension RestaurantViewController : HomeVCDelegate {
    
}

extension RestaurantViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel.locationdata != nil {
            return self.viewModel.locationdata.results.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        let dict = self.viewModel.locationdata.results[indexPath.row]
        cell.restaurantNameLabel.text = dict.name ?? ""
        let restaurantColorCode = dict.iconBackgroundColor ?? ""
        cell.restaurantImageView.setImage(with: dict.icon ?? "", placeHolder: UIImage(named: ""))
        cell.restaurantImageView.backgroundColor =  UIColor(hexString: restaurantColorCode)
        cell.restaurantImageView.makeViewCircular()
        cell.detailslbl.text = dict.vicinity ?? ""
        
        if dict.openingHours == nil {
            cell.shopstatuslbl.text = " CLOSED  "
        } else {
            if dict.openingHours.openNow == true {
                cell.shopstatuslbl.text = " OPEN  "
            } else {
                cell.shopstatuslbl.text = " CLOSED  "
            }
        }
        cell.ratingslbl.text = "\(dict.rating ?? 0)"
        return cell
    }
    
}
