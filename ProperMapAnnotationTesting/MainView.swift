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
    
//    var bryanJonesTheatre = Position(name: "Bryan Jones Theatre", coordinate: CLLocationCoordinate2D(latitude: 44.439680, longitude: -78.265033))
    
    var whereabout = [
    
        Position(name: "Bryan Jones Theatre", coordinate: CLLocationCoordinate2D(latitude: 44.439642, longitude: -78.264975))
        
        ,
        
        Position(name: "Parking Lot 1", coordinate: CLLocationCoordinate2D(latitude: 44.438789, longitude: -78.264901))
        
        ,
        
        Position(name: "Parking Lot 2", coordinate: CLLocationCoordinate2D(latitude: 44.437691, longitude: -78.265790))
        
        ,
        
        Position(name: "Parking Lot 3", coordinate: CLLocationCoordinate2D(latitude: 44.440941, longitude: -78.264115))
        
        ,
        
        Position(name: "Parking Lot 4", coordinate: CLLocationCoordinate2D(latitude: 44.440165, longitude: -78.264203))
    
    ]
    
    @State var route: MKPolyline?
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: whereabout) { position in
//                MapMarker(coordinate: position.coordinate)
            MapAnnotation(coordinate: position.coordinate) {
                HelperView(title: position.name)
            }
        }
        .onAppear {
            MKMapView.appearance().mapType = .satelliteFlyover
        }
        .ignoresSafeArea()
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
