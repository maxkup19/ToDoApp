//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    
    let title: String
    let isCompleted: Bool
}
