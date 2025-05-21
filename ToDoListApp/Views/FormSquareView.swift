//
//  FormSquareView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 14.04.2025.
//

import SwiftUI

struct FormSquareView: View {
    let background: Color
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(background)
            .stroke(Color.black, lineWidth: 2)
            .frame(width: width, height: height)
    }
}

#Preview {
    VStack {
        FormSquareView(background: .purple, width: 200, height: 100)
    }
    .padding()
}
