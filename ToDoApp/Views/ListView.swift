//
//  ContentView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var lvm: ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(lvm.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                lvm.updateItem(item)
                            }
                        }
                }
                .onDelete(perform: lvm.deleteItem)
                .onMove(perform: lvm.moveItem)
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
            .environmentObject(ListViewModel())
    }
}
