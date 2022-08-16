//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    private let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let codedData = UserDefaults.standard.data(forKey: itemsKey),
            let encodedData = try? JSONDecoder().decode([ItemModel].self, from: codedData)
        else { return }
        
        self.items = encodedData
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        } else {
            print("Encode error")
        }
    }
}
