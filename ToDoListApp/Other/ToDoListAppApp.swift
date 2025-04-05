//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 03.04.2025.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
