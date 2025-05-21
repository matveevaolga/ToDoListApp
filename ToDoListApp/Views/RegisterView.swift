//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Sign up", subTitle: "Be more productive", angle: 0, background: .yellow, titleColor: .purple).offset(y: -5)
            Form {
                TextField("Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()
                TextField("Email", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                HStack{
                    Spacer()
                    FormButton(title: "Send Form", background: .yellow) {
                        viewModel.register()
                    }
                    Spacer()
                }.offset(y: 20)
            }
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
