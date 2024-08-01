//
//  DataHelper.swift
//  Runner
//
//  Created by Evgenii Sedanov on 14.07.2024.
//

import Foundation
import SwiftUI

class DataHelper {
    static private let defaults: UserDefaults? = UserDefaults(suiteName: "group.what.are.u")
    static private let flutterCountKey = "flutter_count"
    
    static func getColor() -> Color {
        guard let defaults else {
            return Color.blue
        }
        guard let red = defaults.value(forKey: "red") as? Double, let green = defaults.value(forKey: "green") as? Double, let blue = defaults.value(forKey: "blue") as? Double, let opacity = defaults.value(forKey: "opacity") as? Double else {
            return Color.blue
        }
        
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: opacity)
    }
    
    static func getCount() -> Int {
        return defaults?.integer(forKey: flutterCountKey) ?? 0
    }
    
    static func setColor(arguments: Dictionary<String, Double>) {
        defaults?.set(arguments["red"], forKey: "red")
        defaults?.set(arguments["green"], forKey: "green")
        defaults?.set(arguments["blue"], forKey: "blue")
        defaults?.set(arguments["opacity"], forKey: "opacity")
    }
    
    static func setCount(count: Int) {
        defaults?.set(count, forKey: flutterCountKey)
    }
}
