//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView()
                // Login Form
                Form {
                    TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {}
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(.purple)
                            Text("Sign In").foregroundColor(.white).bold()
                        }
                    }
                }
                // CreateAccount
                VStack {
                    Text("Don't have an account yet?")
                    NavigationLink("Sign Up",destination: RegisterView())
                }.padding(.bottom, 30)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
