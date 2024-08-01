import UIKit
import WidgetKit
import Flutter
import CoreLocation
import ActivityKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let locationManager = CLLocationManager()
  private var widgetHelper: WidgetHelper?


  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      locationManager.delegate = self
      let status = locationManager.authorizationStatus
      switch status {
      case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
          break
      case .authorizedWhenInUse:
          locationManager.requestAlwaysAuthorization()
          break
      default:
          break
      }
      
    LiveActivityHelper.create()
    
    widgetHelper = WidgetHelper(controller: window?.rootViewController as! FlutterViewController)
      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


extension AppDelegate: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("status \(status)")
    }
}



















//import UIKit
//import Flutter
//import CoreLocation
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//  private let locationManager = CLLocationManager()
//    
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//    GeneratedPluginRegistrant.register(with: self)
//      locationManager.delegate = self
//      let status = locationManager.authorizationStatus
//      switch status {
//      case .notDetermined:
//          locationManager.requestWhenInUseAuthorization()
//          break
//      case .authorizedWhenInUse:
//          locationManager.requestAlwaysAuthorization()
//          break
//      default:
//          break
//      }
//      
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//  }
//}
//
//
//extension AppDelegate: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        print("status \(status)")
//    }
//}
