//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/21/21.
//

import SwiftUI

struct AnimalDetailView: View {
    // Property
    let animal: Animal
    
    // Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // FACTS
                
                // DESCRIPTION
                
                // MAP
                
                // LINK
            }// VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }// SCROLLVIEW
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[2])
        }
    }
}
