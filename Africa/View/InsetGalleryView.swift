//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/21/21.
//

import SwiftUI

struct InsetGalleryView: View {
    // Property
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 15){
                /*
                    "animal.gallery"
                    pull data from animal gallery. "id: \.self"
                    Use names as unique
                    identifier since they don't have ids in photos. In order to
                    work in for each.
                */
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }// loop
            }// HSTACK
        }// Scroll
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
