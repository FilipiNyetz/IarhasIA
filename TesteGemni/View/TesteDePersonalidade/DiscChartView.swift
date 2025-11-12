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
                        angularInset: 2.0
                    )
                    .foregroundStyle(color(for: data.label))
                    .cornerRadius(6)
                }
            }
            .frame(width: 220, height: 220)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .center)
            
            // Legenda customizada
            HStack(spacing: 15) {
                ForEach(viewModel.chartData, id: \.id) { item in
                    Label {
                        Text(labelName(for: item.label))
                            .font(.subheadline)
                    } icon: {
                        Circle()
                            .fill(color(for: item.label))
                            .frame(width: 14, height: 14)
                    }
                }
            }
        }
        .padding()
    }
    
    // Nome completo do fator
    private func labelName(for label: String) -> String {
        switch label {
        case "D": return "Dominância"
        case "I": return "Influência"
        case "S": return "Estabilidade"
        case "C": return "Conformidade"
        default: return label
        }
    }
    
    // Cor fixa para cada tipo DISC
    private func color(for label: String) -> Color {
        switch label {
        case "D": return .red.opacity(0.8)
        case "I": return .orange.opacity(0.8)
        case "S": return .green.opacity(0.8)
        case "C": return .blue.opacity(0.8)
        default: return .gray
        }
    }
}

#Preview {
    let vm = DiscViewModel()
    vm.result = ["D": 8, "I": 6, "S": 3, "C": 4]
    return DiscDonutChartView(viewModel: vm)
}
