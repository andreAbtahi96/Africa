//
//  VideoModel.swift
//  Africa
//
//  Created by Andre Abtahi on 7/24/21.
//
//  This new type will let us decode our video json file

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computer Property - simplifies the code here. Reducing longer lines of code.
    var thumbnail: String{
        "video-\(id)"
    }
}
