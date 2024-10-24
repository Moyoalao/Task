//
//  ContentView.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var reminderList: [ReminderList]
    @State private var path = [ReminderList]()
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    Section {
                        VStack {
                            LazyVGrid(columns: columns, spacing: nil) {
                                ForEach(reminderList.prefix(4)) { reminders in
                                    ListCardView(reminderList: reminders)
                                }
                            }
                        }
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowInsets(EdgeInsets())
                    
                    Section {
                        ForEach(reminderList) { reminders in
                            NavigationLink {
                                RemiderListView(reminderList: reminders)
                            } label: {
                                RemiderListRowView(remiderList: reminders)
                            }
                            .listRowInsets(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 15))
                        }
                        .onDelete(perform: delete)
                    } header: {
                        Text("All Reminders")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("Reminders")
            .navigationDestination(for: ReminderList.self, destination: CreateTabView.init)
            .toolbar {
                Button(action: {
                    addTab()
                }) {
                    Label("Add Tab", systemImage: "plus")
                }
            }
            .overlay {
                if reminderList.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Reminders", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Add a reminder to get started")
                    }, actions: {
                        Button("Add Reminder", action: addTab)
                    })
                    .offset(y: -60)
                }
            }
        }
    }
    
    func addTab() {
        let tab = ReminderList()
        modelContext.insert(tab)
        path = [tab]
    }
    
    func delete(_ indexSet: IndexSet) {
        for index in indexSet {
            let reminderLists = reminderList[index]
            modelContext.delete(reminderLists)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: ReminderList.self, inMemory: true)
}
