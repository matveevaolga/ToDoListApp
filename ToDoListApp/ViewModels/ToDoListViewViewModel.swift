//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
