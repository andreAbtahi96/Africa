//
//  CreditsView.swift
//  Africa
//
//  Created by Andre Abtahi on 8/3/21.
//

import SwiftUI

struct CreditsView: View {
    // PROPERTIES
    
    // BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright @ Robert Petras
    All right reserved
    Better Apps ♡ Less Code
    """)
         .font(.footnote)
         .multilineTextAlignment(.center)
        }// VSTACK
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
