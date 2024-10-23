//
//  TaskApp.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import SwiftUI
import SwiftData

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: ReminderList.self)
    }
}
