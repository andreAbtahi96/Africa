//
//  InsetFactView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/21/21.
//

import SwiftUI

struct InsetFactView: View {
    
    // properties
    let animal: Animal
    
    // body
    
    var body: some View {
        GroupBox{
            TabView{
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }// LOOP
            }// TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }// GROUPBOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
