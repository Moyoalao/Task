//
//  ListCardView.swift
//  Task
//
//  Created by Musibau Alao on 23/10/2024.
//

import SwiftUI
import SwiftData

struct ListCardView: View {
    @Bindable var reminderList: ReminderList
    @State private var linkisActive = false
    
    
    var body: some View {
        Button {
            linkisActive = true
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    listIcon
                    Spacer()
                    Text("\(reminderList.reminder.count)")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.trailing)
                }
                Text(reminderList.name)
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(.secondary)
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
        }
        .overlay( NavigationLink(isActive: $linkisActive,
                                 destination: { RemiderListView(reminderList: reminderList) },
                                 label: { EmptyView() }
                                ).opacity(0)
        ).buttonStyle(.plain)
    }
    
    var listIcon: some View {
        ZStack {
            Circle()
                .frame(width: 27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }
    }
    
}

#Preview {
   
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name:"Today", iconName: "sum.max.fill", reminders: [Reminder(name: "Walk the dog")])
        
         ListCardView(reminderList: example)
        .modelContext(container.mainContext)
        
    
}
