//
//  Position.swift
//  ProperMapAnnotationTesting
//
//  Created by Russell Gordon on 2023-02-07.
//

import Foundation
import MapKit

struct Position: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

var positions = [

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

