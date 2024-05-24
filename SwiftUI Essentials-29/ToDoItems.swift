//
//  ToDoItems.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import Foundation

struct ToDoItems {
    var detail: String
    var date: String
    var icon: String
    
    static func preview() -> [ToDoItems] {
        [
            ToDoItems(detail: "Mobile App Research", date: "4 Oct", icon: "calendar"),
            ToDoItems(detail: "Prepare Wireframe for Main Flow", date: "4 Oct", icon: "calendar"),
            ToDoItems(detail: "Prepare Screens", date: "4 Oct", icon: "calendar"),
            ToDoItems(detail: "Website Research", date: "4 Oct", icon: "calendar"),
            ToDoItems(detail: "Prepare Wireframe for Main Flow", date: "4 Oct", icon: "calendar"),
            ToDoItems(detail: "Prepare Screens", date: "4 Oct", icon: "calendar"),
        ]
    }
}


