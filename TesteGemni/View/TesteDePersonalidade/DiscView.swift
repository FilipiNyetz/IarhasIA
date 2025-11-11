//
//  DiscView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI

// MARK: - View Principal do DISC
struct DiscView: View {
    @StateObject private var viewModel = DiscViewModel()
    
    var body: some View {
        ZStack {
            // 1. Fundo 100% da Tela
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            VStack {
                if viewModel.finished {
                    // Chama a view de Resultado
                    ResultView(viewModel: viewModel)
                } else {
                    // Chama a view de Perguntas
                    QuestionView(viewModel: viewModel)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 25)
            // Animações para transições suaves
            .animation(.easeInOut, value: viewModel.currentIndex)
            .animation(.default, value: viewModel.finished)
        }
    }
}

