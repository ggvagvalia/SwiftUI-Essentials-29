//
//  ToDoListView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDoItems = ToDoItems.preview()
    @State private var selectedItemId: UUID?
    @Binding var isChecked: Bool
    @Environment(\.colorScheme) var mode
    @Binding var checkedItemCount: Int
    
    var combinedItemsArray: [CombinedItems] {
        let combinedUnchecked = toDoItems.map { CombinedItems(todoItem: $0, isChecked: true) }
        return combinedUnchecked
    }
    
    var body: some View {
        let backgroundColor: Color = mode == .light ? .white : .gray
        //        let backgroundColorLight: Color = mode == .light ? .black : .white
        //                        List {
        ForEach(combinedItemsArray) { item in
            let item = item.todoItem
            let isChecked = item.isChecked
            
            HStack {
                Rectangle()
                    .foregroundColor(item.color)
                    .frame(width: 15)
                    .padding(.trailing)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(item.detail)
                    HStack {
                        Image(systemName: "\(item.icon)")
                        Text(item.date)
                    }
                }
                Spacer()
                Button(action: {
                    self.toggleChecked(id: item.id)
                    updateCheckedItemCount()
                }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill"  : "circle")
                        .font(.system(size: 26))
                        .background(isChecked ? .black : .clear)
                        .foregroundColor(.blue)
                        .clipShape(Circle())
                }
                .padding()
            }
            .background(backgroundColor)
            .cornerRadius(10)
        }
        //                        .listStyle(.plain)
        .onAppear {
            updateCheckedItemCount()
            
        }
        
    }
    private func toggleChecked(id: UUID) {
        if let index = toDoItems.firstIndex(where: { $0.id == id }) {
            toDoItems[index].isChecked.toggle()
            updateCheckedItemCount()
            toDoItems.sort(by: { $0.isChecked && !$1.isChecked })
            
        }
    }
    private func updateCheckedItemCount() {
        let checkedCount = toDoItems.filter { $0.isChecked }.count
        checkedItemCount = checkedCount
    }
}

#Preview {
    ToDoListView(isChecked: .constant(false), checkedItemCount: .constant(0))
}

