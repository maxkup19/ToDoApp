//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
}
