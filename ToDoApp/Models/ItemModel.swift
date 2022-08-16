//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
