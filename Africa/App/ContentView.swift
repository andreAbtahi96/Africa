//
//  ContentView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//

import SwiftUI

struct ContentView: View {
    
    //  PROPERTIES
    let animals: [Animal] = Bundle.main.decode(file: "animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    // Advanced Feature - switching up grid views
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1 // checks number of columns to change image of grid button
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // FUNCTIONS
    func gridSwitch(){
        // add 1 to increase grid
        gridLayout = Array(repeating: .init(.flexible() ), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number is: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch(gridColumn){
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }// SWITCH
        
    }// GRIDSWITCH
    
    var body: some View {
        // BODY
        NavigationView{
            
            // if gridview isn't selected, default is list view
            Group{
                if !isGridViewActive {
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
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })// LINK
                            }// LOOP
                        }// GRID
                        .padding(10)
                        .animation(.easeIn)
                    }// SCROLL
                }// CONDITIONAL
            }// GROUP
            
            
            .navigationBarTitle("Africa", displayMode: .large)
            
            //  Create new toolbar for list and grid buttons
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        
                        // LIST BUTTON
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })// BUTTON
                        
                        // GRID BUTTON
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })// BUTTON
                        
                    }// HSTACK
                }// BUTTONS
            }// TOOLBAR
        }// NAVIGATIONVIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
