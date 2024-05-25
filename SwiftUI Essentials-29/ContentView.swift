//
//  ContentView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var mode
    @State var totalItems = ToDoItems.preview().count
    @State var totalItemsArray = ToDoItems.preview()
    @State var isChecked = true
    @State private var checkedItemsCount = 0
    var percent: Int {
        Int(Double(checkedItemsCount) / Double(totalItems) * 100)
    }
    
    var body: some View {
        let backgroundColorForView: Color = mode == .light ? .white : .gray
        let backgroundImage: Image = mode == .light ? Image("lightBackground") : Image("darkModeBackground")
        
        ZStack {
            backgroundImage
                .resizable()
                .ignoresSafeArea()
            // MARK: - FIRST VSTACK
            VStack {
                Spacer(minLength: 60)
                HStack {
                    Spacer(minLength: 1)
                    Text("You have \(checkedItemsCount) tasks\nto complete")
                        .font(.system(size: 25))
                    //                        .foregroundColor(.black)
                        .bold()
                    Spacer(minLength: 140)
                    ZStack {
                        Image("profile_picture")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Badge(text: "\(checkedItemsCount)")
                            .offset(x: 13, y: 15)
                    }
                    Spacer(minLength: 1)
                }
                // MARK: - Complete All
                CompleteAllButton(todoItems: $totalItemsArray, checkedItemsCount: $checkedItemsCount)
                // MARK: - Second - Progress View (inside first - vstack
                ScrollView {
                    VStack {
                        HStack {
                            Text("Progress")
                                .font(.system(size: 22))
                            //                        .frame(width: .infinity)
                                .safeAreaPadding(.leading)
                            Spacer()
                            
                        }
                        // MARK: - Second - Task View
                        VStack(alignment: .leading, spacing: 8) {
                            mode == .light ? Color.white : Color.gray
                            
                            Text("Daily Task")
                                .font(.system(size: 18))
                                .bold()
                            Text("\(checkedItemsCount)/6 Task Completed")
                                .font(.system(size: 16))
                            HStack {
                                Text("Keep  working")
                                    .font(.system(size: 14))
                                Spacer()
                                Text("\(percent)%")
                                    .font(.system(size: 18))
                            }
                            ProgressBar(totalItemCount: CGFloat(totalItems), checkedItemsCount: $checkedItemsCount)
                                .animation(.default, value: checkedItemsCount )
                            //                                                    .animation(.spring())
                            ProgressView(value: 50, total: 100)
                            
                        }
                        
                        .safeAreaPadding()
                        .frame(width: 370, height: 139)
                        .background(backgroundColorForView)
                        .cornerRadius(8)
                        HStack() {
                            Text("Completed Tasks")
                                .font(.system(size: 22))
                                .bold()
                                .safeAreaPadding()
                            
                            
                            Spacer()
                        }
                        ToDoListView(isChecked: $isChecked, checkedItemCount: $checkedItemsCount)
                            .frame(width: 350, height: 80)
                            .cornerRadius(20)
                            .padding(.vertical, 2)
                        
                        
                    }
                }
                
            }
            
            .ignoresSafeArea(.all)
            //        .ignoresSafeArea()
            //        .frame(width: 439, height: 220)
        }
    }
    
    
    struct Badge: View {
        var text: String
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 15, height: 15)
                
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
