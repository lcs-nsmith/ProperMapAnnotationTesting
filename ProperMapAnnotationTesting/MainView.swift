//
//  ContentView.swift
//  ProperMapAnnotationTesting
//
//  Created by Nathan on 2023-02-07.
//

import SwiftUI
import _MapKit_SwiftUI
import MapKit
import CoreLocation

struct Position: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MainView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.439230, longitude: -78.265300), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
    
    var bryanJonesTheatre = Position(name: "Bryan Jones Theatre", coordinate: CLLocationCoordinate2D(latitude: 44.439680, longitude: -78.265033))
    
    @State var route: MKPolyline?
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [bryanJonesTheatre]) { position in
            MapMarker(coordinate: position.coordinate)
        }
        .onAppear {
            MKMapView.appearance().mapType = .satelliteFlyover
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
