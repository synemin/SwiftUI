//
//  CircleImage.swift
//  Landmarks
//
//  Created by augday on 2022/8/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        if #available(iOS 15.0, *) {
            image
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } else {
            // Fallback on earlier versions
            // TODO: Compatible with other versions
        }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerrock"))
    }
}
