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
            // Fundo mais suave que o branco puro
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                if viewModel.finished {
                    // Chama a view de Resultado
                    ResultView(viewModel: viewModel)
                } else {
                    // Chama a view de Perguntas
                    QuestionView(viewModel: viewModel)
                }
            }
            // Animações para transições suaves
            .animation(.easeInOut, value: viewModel.currentIndex)
            .animation(.default, value: viewModel.finished)
        }
    }
}

// MARK: - View de Perguntas
struct QuestionView: View {
    @ObservedObject var viewModel: DiscViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            // --- Barra de Progresso ---
            VStack(spacing: 8) {
                ProgressView(value: Double(viewModel.currentIndex + 1), total: Double(viewModel.questions.count))
                    .progressViewStyle(LinearProgressViewStyle())
                    .tint(.green) // Um toque de cor
                    .padding(.horizontal)
                
                Text("Pergunta \(viewModel.currentIndex + 1) de \(viewModel.questions.count)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            // --- Instrução ---
            Text("Escolha a opção que **mais** te representa:")
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.secondarySystemGroupedBackground))
                .cornerRadius(12)
                .padding(.horizontal)
            
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
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: viewModel.mostSelected == option ? "checkmark.circle.fill" : "circle")
                                .font(.title2)
                                .foregroundColor(viewModel.mostSelected == option ? .green : .gray.opacity(0.3))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(viewModel.mostSelected == option ? .green : Color.clear, lineWidth: 2)
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
            .background(viewModel.mostSelected == nil ? Color(UIColor.systemGray4) : .green)
            .foregroundColor(viewModel.mostSelected == nil ? Color(UIColor.systemGray) : .white)
            .cornerRadius(12)
            .padding(.horizontal)
            .disabled(viewModel.mostSelected == nil)
        }
        .padding(.vertical)
    }
}

// MARK: - View de Resultados
struct ResultView: View {
    @ObservedObject var viewModel: DiscViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                
                // --- Título ---
                Text("Resultado do Teste DISC")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()
                
                // --- Gráfico ---
                DiscDonutChartView(viewModel: viewModel)
                    .frame(height: 250)
                    .padding(.vertical)
                
                // --- Legenda/Scores ---
                HStack {
                        
                        // Defina a ordem exata que você deseja
                        let fixedOrder = ["D", "I", "S", "C"]

                        // Itere sobre essa ordem fixa
                        ForEach(fixedOrder, id: \.self) { key in
                            VStack(spacing: 4) {
                                Text(key)
                                    .font(.headline)
                                
                                // Busque o valor correspondente no dicionário
                                Text("\(viewModel.result[key] ?? 0)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(12)
                
                // --- Descrições em Cartões ---
                
                if let primaryDescription = viewModel.discResult?.primary.description {
                    DescriptionCard(title: "Perfil Principal", text: primaryDescription)
                }
                
                if let secondaryDescription = viewModel.discResult?.secondary.description {
                    DescriptionCard(title: "Perfil Secundário", text: secondaryDescription)
                }
                
                if let primaryPontosFortes = viewModel.discResult?.primary.pontosFortes {
                    DescriptionCard(title: "Pontos Fortes", text: "\(primaryPontosFortes)")
                }

                if let primaryPontosFracos = viewModel.discResult?.secondary.pontosFracos {
                    DescriptionCard(title: "Pontos a Desenvolver", text: "\(primaryPontosFracos)")
                }
                
                if let blendDescription = viewModel.discResult?.blendDescription {
                    DescriptionCard(title: "Sua Combinação", text: blendDescription)
                }
            }
            .padding()
        }
    }
}

// MARK: - Subview (Helper)
// Um cartão reutilizável para mostrar os textos de resultado
struct DescriptionCard: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(text)
                .font(.body)
                .lineSpacing(5)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

