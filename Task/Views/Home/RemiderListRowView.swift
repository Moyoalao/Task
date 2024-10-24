//
//  RemiderListRowView.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import SwiftUI
import SwiftData

struct RemiderListRowView: View {
    @Bindable var remiderList: ReminderList
    
    var body: some View {
        HStack {
            listIcon
            Text(remiderList.name)
            Spacer()
            Text("\(remiderList.reminder.count)")
        }
    }
    
    var listIcon: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 20, height: 20)
                .padding()
            
            Image(systemName: remiderList.iconName)
                .foregroundColor(.white)
                .font(.footnote)
                .bold()
        }
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ReminderList.self, configurations: config)
    let example = ReminderList(name: "Example", 
                             iconName: "iphone",
                             reminders: [
                                Reminder(name:"Task1"),
                                Reminder(name:"Call Mom")
                             ])
    
    RemiderListRowView(remiderList: example)
        .modelContext(container.mainContext)  
}
