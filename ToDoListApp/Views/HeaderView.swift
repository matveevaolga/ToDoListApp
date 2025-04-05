//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0).foregroundColor(.purple).rotationEffect(Angle(degrees: 10))
            
            VStack {
                Text("To-Do List").font(.system(size: 55)).foregroundColor(.yellow).bold()
                
                Text("Productivity app").font(.system(size: 32)).foregroundColor(.white).bold()
            }.padding(.top, 30)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 310).offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
