//
//  ContentView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var percent: CGFloat = 70
    @Environment(\.colorScheme) var mode
    
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
                    Text("You have 3 tasks\nto complete")
                        .font(.system(size: 25))
                    //                        .foregroundColor(.black)
                        .bold()
                    Spacer(minLength: 140)
                    Image("profile_picture")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Spacer(minLength: 1)
                }
                //                .background(Color.white)
                CompleteAllButton()
                // MARK: - Second - Progress View (inside first - vstack
                HStack {
                    Text("Progress")
                        .font(.system(size: 22))
                        .frame(width: .infinity)
                        .safeAreaPadding(.leading)
                    Spacer()
                    
                }
                // MARK: - Second - Task View
                VStack(alignment: .leading, spacing: 8) {
                    mode == .light ? Color.white : Color.gray
                    
                    Text("Daily Task")
                        .font(.system(size: 18))
                        .bold()
                    Text("3/6 Task Completed")
                        .font(.system(size: 16))
                    HStack {
                        Text("Keep  working")
                            .font(.system(size: 14))
                        Spacer()
                        Text("\(Int(percent))%")
                            .font(.system(size: 18))
                    }
                    
                    
                    ProgressBar(percent: percent)
                    //                        .animation(.default, value: )
                    //                        .animation(.spring())
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
                ToDoListView()
            }
            
            
        }
        .ignoresSafeArea(.all)
        
        //        .ignoresSafeArea()
        //        .frame(width: 439, height: 220)
    }
}

#Preview {
    ContentView()
}
