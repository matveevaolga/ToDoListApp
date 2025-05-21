//
//  TitleButton.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 06.04.2025.
//

import SwiftUI

struct FormButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }
        label: {
            ZStack {
                FormSquareView(background: background, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 15)
                Text(title).foregroundColor(.white).bold()
            }.padding(.bottom, 30)
        }
    }
}

#Preview {
    FormButton(title: "Sign In", background: .purple) {
    }
}
