//
//  CompleteAllButton.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct CompleteAllButton: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            ZStack {
                Image("buttonBackgroundImage")
                    .resizable()
                Text("Complete All")
                    .foregroundColor(.white)
            }
            .frame(width: 370, height: 50)
            .cornerRadius(15)
        })
    }
}

#Preview {
    CompleteAllButton()
}
