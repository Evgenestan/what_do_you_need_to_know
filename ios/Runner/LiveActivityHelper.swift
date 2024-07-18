//
//  LiveActivityHelper.swift
//  Runner
//
//  Created by Evgenii Sedanov on 15.07.2024.
//

import Foundation
import ActivityKit

class LiveActivityHelper {
    private static var activity: Activity<widgetAttributes>?
    
    static func create() {
        let activities = Activity<widgetAttributes>.activities
        if (activities.isEmpty) {
            let atr = widgetAttributes()
            let state = widgetAttributes.ContentState(count: DataHelper.getCount())
            activity = try? Activity<widgetAttributes>.request(attributes: atr, content: .init(state: state, staleDate: nil))
        } else {
            activity = activities.first
        }
    }
    
    static func update(count: Int) {
        let state = widgetAttributes.ContentState(count: count)
        Task {
            await activity?.update(.init(state: state, staleDate: nil))
          }
    }
}
