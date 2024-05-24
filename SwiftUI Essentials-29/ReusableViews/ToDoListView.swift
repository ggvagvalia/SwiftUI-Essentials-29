//
//  ToDoListView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDoItems = ToDoItems.preview()
    @Environment(\.colorScheme) var mode
    
    var body: some View {
        let backgroundColor: Color = mode == .light ? .white : .gray
        
        List(toDoItems, id: \.detail) { item in
            VStack(alignment: .leading) {
                Text(item.detail)
                HStack {
                    Image(systemName: "\(item.icon)" )
                    Text(item.date)
                }
            }
            
        }
        .listRowBackground(backgroundColor)
        .listStyle(PlainListStyle())
        .safeAreaPadding()
        .frame(width: 365)
        
    }
}

#Preview {
    ToDoListView()
}
