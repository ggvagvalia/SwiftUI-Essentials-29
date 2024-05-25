//
//  ContentView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var mode
    @State var totalItemsArray = ToDoItems.preview()
    @State var isChecked = true
    @State private var checkedItemsCount = 0
    
    var body: some View {
        let backgroundColorForView: Color = mode == .light ? .white : .color4
        let backgroundImage: Image = mode == .light ? Image("lightBackground") : Image("darkModeBackground")
        
        ZStack {
            backgroundImage
                .resizable()
                .ignoresSafeArea()
            
            // MARK: - FIRST VSTACK
            VStack() {
                Spacer(minLength: 10)
                HStack {
                    Spacer(minLength: 1)
                    Text("You have \(totalItemsArray.count - checkedItemsCount) tasks\nto complete")
                        .font(.system(size: 25))
                        .bold()
                    Spacer(minLength: 140)
                    BadgeProfileView(text: "\(totalItemsArray.count - checkedItemsCount)")
                    Spacer(minLength: 1)
                }
                Spacer(minLength: 35)
                CompleteAllButton(todoItems: $totalItemsArray, checkedItemsCount: $checkedItemsCount)
                Spacer(minLength: 19)
                
                // MARK: - Second - Progress View + ListView
                ScrollView {
                    VStack {
                        HStack {
                            Spacer(minLength: 1)
                            Text("Progress")
                                .font(.system(size: 22))
                            Spacer(minLength: 300)
                        }
                        Spacer(minLength: 20)
                        
                        // MARK: - Second - Detailer Progress View
                        ProgressDetailsView(checkedItemsCount: $checkedItemsCount, totalItemsArray: $totalItemsArray)
                            .frame(width: 365, height: 139)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .background(backgroundColorForView)
                            .cornerRadius(8)
                        HStack() {
                            Text("Completed Tasks")
                                .font(.system(size: 22))
                                .bold()
                                .safeAreaPadding()
                            Spacer()
                        }
                        ToDoListView(toDoItems: $totalItemsArray, isChecked: $isChecked, checkedItemCount: $checkedItemsCount)
                            .frame(width: 385, height: 80)
                            .background(backgroundColorForView)
                            .cornerRadius(8)
                            .padding(.vertical, 2)
                    }
                }
            }
            .safeAreaPadding(.leading)
            .safeAreaPadding(.trailing)
        }
    }
}

#Preview {
    ContentView()
}
