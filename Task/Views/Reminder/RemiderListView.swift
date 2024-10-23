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
    @Bindable var remiderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(remiderList.name)
            Spacer()
            Text("\($remiderList.reminder.count)")

        }
        .font(.system(.largeTitle, design: .rounded ))
        .foregroundStyle(.primary)
        .padding(.horizontal)
        .bold()
        
        
        List {
            ForEach(remiderList.reminder){ reminder in
                ReminderRowView(reminder: reminder)
            }
            .onDelete(perform: delete )
        }
        .listStyle(.inset)
    }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {
                    reminderList.reminder.append(Reminder(name: " "))
                } label: {
                    HStack(spacing: 7) {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                    .font(.system(.body, Design: .rounded))
                    .bold()
                    .foregroundColor(.primary)
                }
                    Spacer()
            }
        }
                       
        func delete(_ indexSet: IndexSet){
                    for index in indexSet {
                        remiderList.reminder.remove(at: index)
                    }
                    try! modelContext.save()
                    
                }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name: "Scheduled", iconName: "Calander", reminders: [Reminder(name:"Grad")])
        
        return RemiderListView(remiderList: example)
            .modelContext(container)
        
    }catch {
        fatalError("Failed To Create model Container")
    }
}
