//
//  ContentView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "first", isCompleted: false),
        ItemModel(title: "second", isCompleted: false),
        ItemModel(title: "third", isCompleted: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {
                    ListRowView(item: $0)
                }
            }
            .listStyle(.plain )
            .navigationTitle("ToDo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView())
            )
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
