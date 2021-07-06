//
//  MainView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/5/21.
//
//  Will contain all other views!

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }// BROWSE TAB
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }// WATCH TAB
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }// LOCATIONS TAB
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }// GALLERY TAB
            
        }// TAB
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
