//
//  QuestionView.swift
//  TesteGemni
//
//  Created by Joao pedro Leonel on 11/11/25.
//

import Foundation
import SwiftUI

struct QuestionView: View {
    @ObservedObject var viewModel: DiscViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            // --- Barra de Progresso ---
            VStack(spacing: 8) {
                ProgressView(value: Double(viewModel.currentIndex + 1), total: Double(viewModel.questions.count))
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(Color("titleColor")) // Um toque de cor
                    .padding(.horizontal)
                
                Text("Pergunta \(viewModel.currentIndex + 1) de \(viewModel.questions.count)")
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(8))
            }
            
            // --- Instrução ---
            Text("Escolha a opção que **mais** te representa:")
                .foregroundColor(Color("TextColor"))
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("CardColor"))
                .cornerRadius(12)
                .padding(.horizontal)
            
            Spacer()
            
            // --- Opções como Cartões ---
            VStack(spacing: 12) {
                let question = viewModel.questions[viewModel.currentIndex]
                
                ForEach(question.options, id: \.self) { option in
                    Button {
                        viewModel.mostSelected = option
                    } label: {
                        HStack {
                            Text(option)
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: viewModel.mostSelected == option ? "checkmark.circle.fill" : "circle")
                                .font(.title2)
                                .foregroundColor(viewModel.mostSelected == option ? Color("titleColor") : .gray.opacity(0.3))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("CardColor"))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.mostSelected == option ? Color("titleColor") : Color.clear, lineWidth: 2)
                        )
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer() // Empurra o botão "Próxima" para baixo
            
            // --- Botão de Ação ---
            Button("Próxima") {
                viewModel.select(most: viewModel.mostSelected)
            }
            .font(.headline)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(viewModel.mostSelected == nil ? Color("CardColor") : Color("titleColor"))
            .foregroundColor(viewModel.mostSelected == nil ? Color("TextColor") : .white)
            .cornerRadius(12)
            .padding(.horizontal)
            .disabled(viewModel.mostSelected == nil)
        }
        .padding(.vertical)
    }
}
