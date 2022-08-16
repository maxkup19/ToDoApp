//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first", isCompleted: false),
            ItemModel(title: "second", isCompleted: false),
            ItemModel(title: "third", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(named: String) {
        items.append(ItemModel(title: named))
    }
    
    func verify(text: String) -> Bool {
        return text.count >= 3 ? true : false
    }
    
    func updateItem(_ item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
    
}
