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
                
                VStack{
                    Text("Teste DISC")
                        .font(Font.headline)
                        .foregroundStyle(Color.title)
                        .fontWeight(.semibold)
                        .padding(.bottom,10)
                
                    
                    // --- Gráfico ---
                    DiscDonutChartView(viewModel: viewModel)
                        .frame(height: 220)
                        .padding(.vertical)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.secondarySystemGroupedBackground))
                .cornerRadius(12)
                
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
                
                
                if let primaryDescription = viewModel.discResult?.primary.description, let secondaryDescription = viewModel.discResult?.secondary.description{
                    ResponseProfileCard(textPrimary: primaryDescription, textSecondary: secondaryDescription)
                }
                
                if let primaryPontosFortes = viewModel.discResult?.primary.pontosFortes {
                    DescriptionCard(title: "Pontos Fortes", list: primaryPontosFortes)
                }

                if let primaryPontosFracos = viewModel.discResult?.secondary.pontosFracos {
                    DescriptionCard(title: "Pontos a Desenvolver", list: primaryPontosFracos)
                }
                
                if let blendDescription = viewModel.discResult?.blendDescription {
                    ResumeCard(text: blendDescription)
                }
            }
            .padding()
        }
    }
}


