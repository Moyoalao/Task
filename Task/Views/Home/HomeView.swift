//
//  ContentView.swift
//  Task
//
//  Created by Musibau Alao on 22/10/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var reminderList: [ReminderList]
    @State private var path = [ReminderList]()
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        NavigationView {
            
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
                            } label : {
                                RemiderListRowView(reminderList: reminders)
                            }
                            .listRowInsets(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 15))
                        }
                    } header: {
                        Text("All Reminders")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("Reminders")
            
        }
    }
}


#Preview {
    HomeView()
}
