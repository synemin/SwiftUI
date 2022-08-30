//
//  FeatureCard.swift
//  SwiftUIDemo
//
//  Created by augday on 2022/8/25.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark

    var body: some View {
        if #available(iOS 15.0, *) {
            landmark.featureImage?
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .overlay {
                    TextOverlay(landmark: landmark)
                }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct TextOverlay: View {
    var landmark: Landmark

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
