//
//  GalleryView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//

import SwiftUI

struct GalleryView: View {
    //  properties
    
    //  new property that will hold info about selected animal in grid
    @State private var selectedAnimal: String = "lion"
    
    
    @State var animals: [Animal] = Bundle.main.decode(file: "animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    //  SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ] // GRIDLAYOUT
    
    
    
    
    //  EFFICIENT GRID DEFINITION from ^
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    
    
    //  DYNAMIC GRID LAYOUT
    
    //  initialized with one grid item
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    //hold # of columns inside grid
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //  body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 30) {
                
                //  Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //  SLIDER
                /*  $gridColumn - since values changes, we unravel the bind
                 
                    in: slider value changes from 2-4. Represents columns.
                 
                    Step - increment by 1.
                 
                    .onChange() - we need to tell the slider what to perform on change.
                              we call gridSwitch() function according to slider value.
                */
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })

                //  GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10 ) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }// .onTapGesture
                    }// LOOP
                }// LAZYVGRID
                animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })// updates grid layout instantly using grid column value
            }// VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }// SCROLLVIEW
        
        //  expands scroll view both horizontally and vertically
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}


struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
