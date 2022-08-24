//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by augday on 2022/8/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView {
                if #available(iOS 14.0, *) {
                    MapView(coordinate: landmark.locationCoordinate)
                        .frame(height:300)
                        .ignoresSafeArea(edges: .top)
                } else {
                    // Fallback on earlier versions
                    // TODO: Compatible with other versions
                }
                
                CircleImage(image: landmark.image)
                    .offset(y:-130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            // Fallback on earlier versions
            // TODO: Compatible with other versions
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
