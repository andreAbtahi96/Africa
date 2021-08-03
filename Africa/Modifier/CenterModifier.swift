//
//  CenterModifier.swift
//  Africa
//
//  Created by Andre Abtahi on 8/3/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View{
        HStack{
            Spacer()
            content
            Spacer()
        }// HSTACK
    }
}
