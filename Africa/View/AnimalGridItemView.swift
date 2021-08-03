//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Andre Abtahi on 8/3/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // PROPERTIES
    let animal: Animal
    
    // BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
