//
//  MainTabView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct MainTabView: View {

    @StateObject var discViewModel = DiscViewModel()
    @StateObject var chatVm = ChatViewModel(manager: ManagerChat())
    @StateObject private var appState = AppState()
    
    var body: some View {

        TabView(selection: $appState.selectedTab) {
            // 🎯 Envolve cada aba em seu próprio NavigationStack para isolamento
                        NavigationStack {
                            HomeView()
                        }
                        .tabItem { Label("Início", systemImage: "house") }
                        .tag(0)
                        
                        NavigationStack {
                            // Passa o VM compartilhado
                            ChatEntrevista(chatVm: chatVm)
                        }
                        .tabItem { Label("Iarhas IA", systemImage: "message.fill") }
                        .tag(1) // A aba de destino é 1
            ConexoesView()
                .tabItem {
                    Label("Conexões", systemImage: "person.3")
                }
            ProfileView()
                .environmentObject(discViewModel)
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
        }
        .environmentObject(appState)
        .environmentObject(chatVm)
    }

}

#Preview {
    MainTabView()
}
