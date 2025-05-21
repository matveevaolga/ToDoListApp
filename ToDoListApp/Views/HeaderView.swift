//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    let titleColor: Color
    
    var body: some View {
        ZStack {
            FormSquareView(background: background, width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.width ).rotationEffect(Angle(degrees: angle)).padding()
            
            VStack {
                Text(title).font(.system(size: 55)).foregroundColor(titleColor).bold()
                
                Text(subTitle).font(.system(size: 32)).foregroundColor(.white).bold()
            }.padding(.top, 30)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 310).offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "To-Do List", subTitle: "Productivity app", angle: 10, background: .purple, titleColor: .yellow)
}
