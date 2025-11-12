//
//  ResultView.swift
//  TesteGemni
//
//  Created by Joao pedro Leonel on 11/11/25.
//

import Foundation
import SwiftUI

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
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 400)
                        .foregroundStyle(Color(.white))
                    
                    // --- Gráfico ---
                    DiscDonutChartView(viewModel: viewModel)
                        .frame(height: 250)
                        .padding(.vertical)
                    
                    
                }
                
                // --- Legenda/Scores ---
                HStack {
                        
                        // Defina a ordem exata que você deseja
                        let fixedOrder = ["D", "I", "S", "C"]

                        // Itere sobre essa ordem fixa
                        ForEach(fixedOrder, id: \.self) { key in
                            VStack(spacing: 4) {
                                Text(key)
                                    .font(.headline)
                                    .foregroundStyle(Color(.label))
                                
                                // Busque o valor correspondente no dicionário
                                Text("\(viewModel.result[key] ?? 0)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.black))
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                    .background(Color(.white))
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


