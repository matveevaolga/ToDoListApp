//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    func login() {
        guard validate() else {
            return
        }
        // Try loggin in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email!"
            return false
        }
        errorMessage = ""
        print("Called")
        return true
    }
}
