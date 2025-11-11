//
//  MainTabView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct MainTabView: View {

    @StateObject var discViewModel = DiscViewModel()
    
    var body: some View {

        TabView {
            ConexoesView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ChatEntrevista()
                .tabItem {
                    Label("Iarhas IA", systemImage: "message.fill")
                }
            //                DiscView()
            //                    .tabItem{
            //                        Label("Connection", systemImage: "person.3")
            //                    }
            ProfileView()
                .environmentObject(discViewModel)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }

        //ConexoesView()
        //ChatEntrevista()
        //DiscView()
        //ProfileView()
    }

}

#Preview {
    MainTabView()
}
