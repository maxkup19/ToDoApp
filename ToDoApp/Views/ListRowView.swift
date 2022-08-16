//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item = ItemModel(title: "item", isCompleted: true)
    static var item1 = ItemModel(title: "item1", isCompleted: false)
    
    static var previews: some View {
        Group {
            ListRowView(item: item)
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
