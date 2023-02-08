//
//  Directions.swift
//  ProperMapAnnotationTesting
//
//  Created by Russell Gordon on 2023-02-07.
//

import MapKit
import SwiftUI

struct Directions: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack(spacing: 0) {
                
                Spacer()
                
                Label("Directions", systemImage: "car")
                    .font(Font.custom("SF Pro", size: 14, relativeTo: .title3))
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.gray)
                    )
                    .foregroundColor(.primary)
                    .colorInvert()
                    .padding(.bottom, 80)
                    .padding(.trailing, 15)
                
            }
        }
        .onTapGesture {
            
            openAddressInMap(address: "Lakefield College School\n4391 County Road 29\nLakefield, Ontario\nK0L2H0")
            
        }

    }
    
    // SOURCE: https://stackoverflow.com/a/74228514
    func openAddressInMap(address: String?) {
        
        guard let address = address else { return }
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks?.first else {
                return
            }
            
            let location = placemarks.location?.coordinate
            
            if let lat = location?.latitude, let lon = location?.longitude{
                let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon)))
                destination.name = address
                
                MKMapItem.openMaps(
                    with: [destination]
                )
            }
        }
    }
}

struct Directions_Previews: PreviewProvider {
    static var previews: some View {
        Directions()
    }
}
