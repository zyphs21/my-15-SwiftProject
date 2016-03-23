//
//  ViewController.swift
//  findMyself
//
//  Created by Hanson on 16/3/22.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.mapType = MKMapType.Standard
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }

    @IBAction func FindButtonDidPressed(sender: AnyObject) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        var center:CLLocation = locationManager.location!
//        //使用自定义位置
//        let center:CLLocation = CLLocation(latitude: 32.029171, longitude: 118.788231)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        
        //设置显示区域
        self.mapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = center.coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = center.description
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = ""
        //添加大头针
        self.mapView.addAnnotation(objectAnnotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    
        self.locationLabel.text = "更新位置发生错误：" + error.description
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    func displayLocationInfo(placemark:CLPlacemark?){
        
        if let containsPlacemark = placemark {
            
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationLabel.text = locality! + "-" +  postalCode! + "-" +  administrativeArea! + "-" +  country!
        }
    }

}

