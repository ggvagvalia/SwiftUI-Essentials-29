//
//  CompleteAllButton.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct CompleteAllButton: View {
    @Binding var todoItems: [ToDoItems]
    @Binding var checkedItemsCount: Int
    
    var body: some View {
        Button(action: {
            print("something")
            for index in todoItems.indices {
                todoItems[index].isChecked = true
                checkedItemsCount = todoItems.count

            }
        }) {
            ZStack {
                Image("buttonBackgroundImage")
                    .resizable()
                Text("Complete All")
                    .foregroundColor(.white)
            }
            .frame(width: 370, height: 50)
            .cornerRadius(15)
        }
    }
}

//#Preview {
//    CompleteAllButton()
//}
