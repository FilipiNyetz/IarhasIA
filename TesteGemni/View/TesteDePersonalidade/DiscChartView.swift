//
//  DiscDonutChartView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI
import Charts

struct DiscDonutChartView: View {
    @ObservedObject var viewModel: DiscViewModel
    
    var body: some View {
        VStack (alignment: .leading){
            
            Chart {
                ForEach(viewModel.chartData) { data in
                    SectorMark(
                        angle: .value("Pontuação", data.value),
                        innerRadius: .ratio(0.55),
                        angularInset: 4.0
                    )
                    .foregroundStyle(color(for: data.label))
                    .cornerRadius(6)
                }
            }
            .frame(width: 220, height: 220)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            
            // Legenda customizada
            VStack(spacing: 8) { // Contêiner Vertical principal
                            
                            // 🎯 LINHA 1: Itens 1 e 2
                            HStack {
                                ForEach(viewModel.chartData.prefix(2), id: \.id) { item in
                                    legendItemView(item: item)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            // 🎯 LINHA 2: Itens 3 e 4
                            HStack {
                                ForEach(viewModel.chartData.suffix(2), id: \.id) { item in
                                    legendItemView(item: item)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal, 20)
                       
        }
        .padding()
        
    }
    private func legendItemView(item: DiscChartData) -> some View {
            Label {
                Text(labelName(for: item.label))
                    .font(.subheadline)
            } icon: {
                Circle()
                    .fill(color(for: item.label))
                    .frame(width: 14, height: 14)
            }
            // Faz com que cada item use o máximo de espaço disponível na sua HStack
            .frame(maxWidth: .infinity, alignment: .center)
        }
    
    // Nome completo do fator
    private func labelName(for label: String) -> String {
        switch label {
        case "D": return "Dominante"
        case "I": return "Influente"
        case "S": return "Estável"
        case "C": return "Conforme"
        default: return label
        }
    }
    
    // Cor fixa para cada tipo DISC
    private func color(for label: String) -> Color {
        switch label {
        case "D": return .red
        case "I": return .orange
        case "S": return .green
        case "C": return .blue
        default: return .gray
        }
    }
}

#Preview {
    let vm = DiscViewModel()
    vm.result = ["D": 8, "I": 6, "S": 3, "C": 4]
    return DiscDonutChartView(viewModel: vm)
}
