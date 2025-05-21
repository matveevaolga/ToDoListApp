//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
                self?.errorMessage = "Registration failed: \(error.localizedDescription)"
                return
            }
            
            guard let userId = result?.user.uid else {
                self?.errorMessage = "Failed to get user ID"
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary()) { error in
            if let error = error {
                print("Error saving user: \(error.localizedDescription)")
            } else {
                print("User successfully saved!")
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters"
            return false
        }
        
        return true
    }
}
