//
//  widget.swift
//  widget
//
//  Created by Evgenii Sedanov on 14.07.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(SimpleEntry(date: Date()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        completion(Timeline(entries: entries, policy: .atEnd))
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct widget: Widget {
    let kind: String = "counter"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widgetEntryView(entry: entry)
                .containerBackground(DataHelper.getColor().gradient, for: .widget)
        }
    }
}

struct widgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemSmall:
            Text("\(DataHelper.getCount())")
        default:
            VStack {
                Text("You have pushed the button this many times:")
                Text("\(DataHelper.getCount())")
            }
        }
        
    }
}
