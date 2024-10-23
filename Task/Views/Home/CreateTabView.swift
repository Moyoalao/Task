//
//  CreateTabView.swift
//  Task
//
//  Created by Musibau Alao on 23/10/2024.
//

import SwiftUI
import SwiftData

struct CreateTabView: View {
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        Form {
            TextField("Name", text: $reminderList.name)
            
            Section("Icon") {
                Picker("Icon", selection: $reminderList.iconName) {
                    Image(systemName: "house").tag("house")
                    Image(systemName: "heart").tag("heart")
                    Image(systemName: "calender").tag("calender")
                    Image(systemName: "flag.fill").tag("flag.fill")
                    Image(systemName: "sun.max.fill").tag("sun.max.fill")
                    Image(systemName: "graduationcap").tag("graduationcap")
                    Image(systemName: "exclamationmark.3").tag("exclamationmark.3")
                    
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Add")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CreateTabView(reminderList: ReminderList())
}
