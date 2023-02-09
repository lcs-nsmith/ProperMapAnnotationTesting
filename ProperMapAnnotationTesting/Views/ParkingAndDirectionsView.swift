//
//  ParkingAndDirectionsView.swift
//  SwiftUI-Chicago-HSE-LCS
//
//  Created by Nathan on 2023-01-31.
//  Copyright © 2023 Gordon, Russell. All rights reserved.
//

/// Imported from the main Chicago-HSE-LCS app, just in case it is ever needed again it will be kept here

import SwiftUI
//import GRDB
import _MapKit_SwiftUI

/// Location of school
///44.439165, -78.266495
///44.439803, -78.265267
///
///Location of points:
///
///Parking Lot 1 (beside wads)
///44.438789, -78.264901 (apple)
///
///Parking Lot 2 (entrance by tennis courts)
///44.437691, -78.265790 (apple)
///
///Parking Lot 3 (bus tournaround)
///44.440941, -78.264115 (apple)
///
///Parking Lot 4 (behind hpc)
///44.440165, -78.264203 (apple)
///
///Theatre
///44.439697, -78.265033 (apple)
///



struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ParkingAndDirectionsView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 44.439230, longitude: -78.265300), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004))
    
    let pins = [
        Location(name: "Parking Lot 1", coordinate: CLLocationCoordinate2D(latitude: 44.438789, longitude: -78.264901)),
        Location(name: "Parking Lot 2", coordinate: CLLocationCoordinate2D(latitude: 44.437691, longitude: -78.265790)),
        Location(name: "Parking Lot 3", coordinate: CLLocationCoordinate2D(latitude: 44.440941, longitude: -78.264115)),
        Location(name: "Parking Lot 4", coordinate: CLLocationCoordinate2D(latitude: 44.440165, longitude: -78.264203)),
        Location(name: "Bryan Jones Theatre", coordinate: CLLocationCoordinate2D(latitude: 44.439697, longitude: -78.265033))
    ]
    
    var body: some View {
        Map(coordinateRegion: $region,  annotationItems: pins, annotationContent: {
            MapMarker(coordinate: $0.coordinate, tint: .green)
        })
        .scaledToFill()
        .padding(.vertical)
        .onAppear {
            MKMapView.appearance().mapType = .satelliteFlyover
        }
    }
}

struct ParkingAndDirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ParkingAndDirectionsView()
    }
}
