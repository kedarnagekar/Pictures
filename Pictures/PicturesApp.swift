//
//  PicturesApp.swift
//  Pictures
//
//  Created by Kedar Nagekar on 01/07/24.
//

import SwiftUI

@main
struct PicturesApp: App {
    var body: some Scene {
        WindowGroup {
           // ContentView()
            PicturesView(size: CGSize(width: 200, height: 200))
        }
    }
}
