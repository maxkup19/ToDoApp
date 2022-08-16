//
//  ContentView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = ["first", "second", "third"]
    
    var body: some View {
        List {
        ForEach(items, id:\.self) { item in
                ListRowView(title: item)
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
