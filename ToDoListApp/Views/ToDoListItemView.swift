//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title).font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        item: .init(
            id: "123",
            title: "Get milk",
            dueDate: Date().timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: true)
    )
}
