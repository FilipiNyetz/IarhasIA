//
//  TesteGemniApp.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI



@main
struct TesteGemniApp: App {
    
    @StateObject var discViewModel = DiscViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
//            DiscView()
//                .environmentObject(discViewModel)
        }
    }
}
