//
//  User.swift
//  ToDoListApp
//
//  Created by Olga Matveeva on 05.04.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
