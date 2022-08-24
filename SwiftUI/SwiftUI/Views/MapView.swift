//
//  MapView.swift
//  Landmarks
//
//  Created by augday on 2022/8/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    var body: some View {
        if #available(iOS 14.0, *) {
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(coordinate)
                }
        } else {
            Text("iOS Version not support.")
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {  
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
