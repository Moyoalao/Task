//
//  RemiderList.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import Foundation
import SwiftData

@Model

final class ReminderList {
    var name: String
    var iconName: String
    @Relationship(deleteRule: .cascade) var reminder = [Reminder]()
    
    init(name: String = " ", iconName: String = "list.bullet", reminders: [Reminder] = [Reminder]()) {
        
        self.name = name
        self.iconName = iconName
        self.reminder = reminders
        
    }

}


