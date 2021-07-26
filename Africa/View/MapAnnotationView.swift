//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/26/21.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // Properties
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // Body
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            /*
             Size of second circle scales up from original to double size.
             Simultaneuously the border color is fading out.
             After 2 seconds is over. Animation starts over at 0.
             
             .scaleEffect - increases the circle
             
             .opacity - creates fading effect, but really we are just reducing the opacity
             simulataneously.
             
             */
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
            
        }// ZSTACK
        .onAppear(){
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1   //everytime this animation happens. Value becomes 1.
            }// ANIMATION
        }// ONAPPEAR
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    static var locations: [NationalParkLocation] = Bundle.main.decode(file: "locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
