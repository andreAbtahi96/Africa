//
//  CoverImageView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/7/21.
//

import SwiftUI

struct CoverImageView: View {
    // PROPERTIES
    
    /*
        decoding file using decode function in bundle extension
        this will decode the file and store the decoded array of
        coverImages into new property for use.
     */
    let coverImages: [CoverImage] = Bundle.main.decode(file: "covers.json")
    
    //BODY
    
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }// LOOP
        }// TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}

// PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
    
}
