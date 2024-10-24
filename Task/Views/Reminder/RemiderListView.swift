//
//  RemiderListView.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import SwiftUI
import SwiftData

struct RemiderListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(reminderList.name)
                Spacer()
                Text("\($reminderList.reminder.count)")
                
            }
            .font(.system(.largeTitle, design: .rounded ))
            .foregroundStyle(.primary)
            .padding(.horizontal)
            .bold()
            
            
            List {
                ForEach(reminderList.reminder){ reminder in
                    ReminderRowView(reminder: reminder)
                }
                .onDelete(perform: delete )
            }
            .listStyle(.inset)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    reminderList.reminder.append(Reminder(name: " "))
                } label: {
                    HStack(spacing: 7) {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.primary)
                }
                Spacer()
            }
        }
    }
    
    func delete(_ indexSet: IndexSet){
                for index in indexSet {
                    reminderList.reminder.remove(at: index)
                }
                try! modelContext.save()
                
            }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ReminderList.self, configurations: config)
    let example = ReminderList(name: "Scheduled",
                             iconName: "Calander",
                             reminders: [Reminder(name:"Grad")])
    
    RemiderListView(reminderList: example)
        .modelContext(container.mainContext) 
}
