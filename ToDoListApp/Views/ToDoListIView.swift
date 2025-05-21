//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { 
                    item in ToDoListItemView(item: item).swipeActions{
                        Button {
                            viewModel.delete(id: item.id)
                        } label: {
                            Text("Delete")
                        }.tint(.red)
                    }
                }
            }.navigationTitle("To-Do List").toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "346U20mUK3ezidJa89Jf3Ohjhep2")
}
