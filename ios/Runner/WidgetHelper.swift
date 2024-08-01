//
//  WidgetHelper.swift
//  Runner
//
//  Created by Evgenii Sedanov on 15.07.2024.
//

import Foundation
import WidgetKit

class WidgetHelper {
    private let channel: FlutterMethodChannel?
    
    init(controller: FlutterViewController) {
        
        
        
        channel = FlutterMethodChannel(name: "counter_channel", binaryMessenger: controller.binaryMessenger)
        
        channel?.setMethodCallHandler({
              (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                switch (call.method) {
                case "set_counter":
                    if let count = call.arguments as? Int {
                        DataHelper.setCount(count: count)
                        LiveActivityHelper.update(count: count)
                        WidgetCenter.shared.reloadTimelines(ofKind: "counter")
                    }
                    result(nil)
                    break
                case "set_color":
                    if let arguments = call.arguments as? Dictionary<String, Double> {
                        DataHelper.setColor(arguments: arguments)
                    }
                    WidgetCenter.shared.reloadTimelines(ofKind: "counter")
                    result(nil)
                    break
                case "get_counter":
                    result(DataHelper.getCount())
                default:
                    break
                }
            })
        
    }
}
