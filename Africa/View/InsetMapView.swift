//
//  InsetMapView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/21/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    // Properties
    
    //create new region for map
    /*
        @State - mandatory for map views in swift. Maps use bindings for zooming, etc.
     
        MKCoordinateRegion - center of content
     
        span - zoom level. smaller span higher zoom. big span less zoom.
        
     
     */
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(
                    destination: MapView()){
                    
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }// HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                    
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    
                    )// BACKGROUND
                }// NAVIGATION
                .padding(12), alignment: .topTrailing //comma = adding attribute
            )// OVERLAY
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
