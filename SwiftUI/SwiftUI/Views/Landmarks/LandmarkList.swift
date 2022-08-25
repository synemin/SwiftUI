//
//  LandmarkList.swift
//  Landmarks
//
//  Created by augday on 2022/8/24.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    var filteredLandMarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
        NavigationView {
            if #available(iOS 14.0, *) {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    
                    ForEach(filteredLandMarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                //            List(filteredLandMarks) { landmark in
                //                NavigationLink {
                //                    LandmarkDetail(landmark: landmark)
                //                } label: {
                //                    LandmarkRow(landmark: landmark)
                //                }
                //            }
                .navigationTitle("Landmarks")
            } else {
                // Fallback on earlier versions
                // TODO: Compatible with other versions
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
//            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 11 Pro Max"/*@END_MENU_TOKEN@*/)
            
    }
}
