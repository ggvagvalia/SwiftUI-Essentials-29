//
//  ToDoItems.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import Foundation
import SwiftUI


struct ToDoItems: Identifiable, Hashable {
    var detail: String
    var date: String
    var icon: String
    var isChecked: Bool
    let id = UUID()
    var color: Color

    
    static func preview() -> [ToDoItems] {
        [
            ToDoItems(detail: "Mobile App Research", date: "4 Oct", icon: "calendar", isChecked: true, color: Color.color1),
            ToDoItems(detail: "Prepare Wireframe for Main Flow", date: "4 Oct", icon: "calendar", isChecked: true, color: Color.color2),
            ToDoItems(detail: "Prepare Screens", date: "4 Oct", icon: "calendar", isChecked: true, color: Color.color3),
            ToDoItems(detail: "Website Research", date: "4 Oct", icon: "calendar", isChecked: false, color: Color.color1),
            ToDoItems(detail: "Prepare Wireframe for Main Flow", date: "4 Oct", icon: "calendar", isChecked: false, color: Color.color2),
            ToDoItems(detail: "Prepare Screens", date: "4 Oct", icon: "calendar", isChecked: false, color: Color.color3),

        ]
    }
}


//struct ToDoItemsChecked: Identifiable {
//    var detail: String
//    var date: String
//    var icon: String
//    let id = UUID()
//    
//    static func preview() -> [ToDoItems] {
//        [
//            ToDoItems(detail: "Mobile App Research", date: "4 Oct", icon: "calendar", isChecked: true),
//            ToDoItems(detail: "Prepare Wireframe for Main Flow", date: "4 Oct", icon: "calendar", isChecked: true),
//            ToDoItems(detail: "Prepare Screens", date: "4 Oct", icon: "calendar", isChecked: true),
//        ]
//    }
//}

struct CombinedItems: Identifiable {
    var todoItem: ToDoItems
    var isChecked: Bool
    
    var id: UUID {
        return todoItem.id
    }
}
