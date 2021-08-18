//
//  StructuresApp.swift
//  Shared
//
//  Created by Игорь Яськин on 18.08.2021.
//

import SwiftUI

@main
struct StructuresApp: App {
    
    init() {
        ExampleFunctions.creatingAndLinkingNodes()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
