//
//  ContentView.swift
//  ProperMapAnnotationTesting
//
//  Created by Nathan on 2023-02-07.
//

import SwiftUI
import MapKit

struct CampusMap: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.439230, longitude: -78.265300), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
    
    @State var route: MKPolyline?
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: positions) { position in
            MapAnnotation(coordinate: position.coordinate) {
                Pin(title: position.name)
            }
        }
        .onAppear {
            MKMapView.appearance().mapType = .satelliteFlyover
        }
        .ignoresSafeArea()
    }
}


struct CampusMap_Previews: PreviewProvider {
    static var previews: some View {
        CampusMap()
    }
}
