//
//  BadgeView.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/25/24.
//

import SwiftUI

struct BadgeView: View {
    var text: String
    var body: some View {
        
        ZStack {
            Image("Ellipse")
            Image("profile_picture")
                .resizable()
                .frame(width: 40, height: 40)
            ZStack {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 15, height: 15)
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
                    .font(.system(size: 9))
            }            .offset(x: 13, y: 15)
        }
        
    }
}

#Preview {
    BadgeView(text: "")
}
