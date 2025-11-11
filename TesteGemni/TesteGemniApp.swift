//
//  TesteGemniApp.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI

@main
struct TesteGemniApp: App {
    
    //@Binding var selection: Int?
    
    var body: some Scene {
        WindowGroup {
            TabView{
                ConexoesView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                ChatEntrevista()
                    .tabItem{
                        Label("Iarhas IA", systemImage: "message.fill")
                    }
                DiscView()
                    .tabItem{
                        Label("Connection", systemImage: "person.3")
                    }
            }
            .foregroundColor(Color("TextColor"))
            
            //ConexoesView()
            //ChatEntrevista()
            //DiscView()
        }
    }
}
