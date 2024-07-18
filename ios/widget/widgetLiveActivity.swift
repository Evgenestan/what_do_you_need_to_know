//
//  widgetLiveActivity.swift
//  widget
//
//  Created by Evgenii Sedanov on 14.07.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var count: Int
    }
}

struct widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: widgetAttributes.self) { context in
            VStack {
                Text("You have pushed the button this many times:")
                Text("\(context.state.count)")
            }
            .activityBackgroundTint(DataHelper.getColor())
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    Text("You have pushed the button this many times:")
                    Text("\(context.state.count)")
                }
            } compactLeading: {
                
            } compactTrailing: {
                Text("\(context.state.count)")
            } minimal: {
                Text("\(context.state.count)")
            }
            .keylineTint(DataHelper.getColor())
        }
    }
}

