//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
