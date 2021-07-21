//
//  ContentView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//

import SwiftUI

struct ContentView: View {
    //  properties
    let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    
    //  body
    
    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }// NAVIGATIONLINK
                    
                }// LOOP
                
            }// LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }// NAVIGATIONVIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
