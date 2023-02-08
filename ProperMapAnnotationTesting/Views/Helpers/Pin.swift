//
//  HelperView.swift
//  ProperMapAnnotationTesting
//
//  Created by Nathan on 2023-02-07.
//

import SwiftUI
import MapKit

struct Pin: View {

    @State private var showTitle = true
    
    let title: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            Text(title)
                .font(.callout)
                .fixedSize(horizontal: true, vertical: false)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(showTitle ? 0 : 1)
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}

struct Pin_Previews: PreviewProvider {
    static var previews: some View {
        Pin(title: "Bryan Jones Theatre")
    }
}
