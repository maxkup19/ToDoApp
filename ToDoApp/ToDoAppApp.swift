//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Max Kup on 16.08.2022.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}
