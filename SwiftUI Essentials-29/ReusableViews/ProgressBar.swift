//
//  ProgressBar.swift
//  SwiftUI Essentials-29
//
//  Created by gvantsa gvagvalia on 5/24/24.
//

import SwiftUI

struct ProgressBar: View {
    var width: CGFloat = 360
    var height: CGFloat = 20
    var totalItemCount: CGFloat
    @Binding var checkedItemsCount: Int
    var color1 = Color(.orange)
    var color2 = Color(.red)
    
    var body: some View {
        
//        let totalItemCount: CGFloat = 6
        let percent = CGFloat(checkedItemsCount) / totalItemCount * 100
        let multiplier = width / 100


        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
            .foregroundColor(Color.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )

                .foregroundColor(.clear)
        }
    }
}

//#Preview {
//    ProgressBar()
//}
