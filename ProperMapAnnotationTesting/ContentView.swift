//
//  ContentView.swift
//  ProperMapAnnotationTesting
//
//  Created by Nathan on 2023-02-07.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  var empireStateBuilding =
  Place(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656))
  
  var body: some View {
    Map(coordinateRegion: $region,
        annotationItems: [empireStateBuilding]
    ) { place in
        MapMarker(coordinate: place.coordinate)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
