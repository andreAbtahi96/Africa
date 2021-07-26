//
//  MapView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // Properties
    @State private var region: MKCoordinateRegion = {
        
        // Coordinates of map
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        // Zoom level of map
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        // Actual Map region
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        //  Note: we always have to use @State property wrapper, since it uses bindings.
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    // Body
    var body: some View {
        
        //  1. Basic Map
        //Map(coordinateRegion: $region)
        
        //  2. Advanced Map - locations of json data
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            
            // (A) PIN: OLD STYLE (always static)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B): NEW STYLE (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C): CUSTOM BASIC ANNOTATION (could be interactive)
            MapAnnotation(coordinate: item.location){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            }// ANNOTATION
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
