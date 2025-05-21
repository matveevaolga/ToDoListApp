//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To-Do List", subTitle: "Productivity app", angle: 0, background: .purple, titleColor: .yellow).offset(y: -5)
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    TextField("Email", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack {
                        Spacer()
                        FormButton(title: "Sign In", background: .purple) {
                            viewModel.login()
                        }
                        Spacer()
                    }.offset(y: 20)
                }
                VStack {
                    Text("Don't have an account yet?")
                    NavigationLink("Sign Up",destination: RegisterView())
                }.padding(.bottom, 30).offset(y: -30)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
