//
//  DiscView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI

struct DiscView: View {
    @StateObject private var viewModel = DiscViewModel()
    
    var body: some View {
        VStack {
            if viewModel.finished {
                Text("🎯 Resultado do Teste DISC")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                ForEach(viewModel.result.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    Text("\(key): \(value)")
                        .font(.headline)
                }
                
                ScrollView{
                    
                    if let primaryDescription = viewModel.discResult?.primary.description{
                        Text(primaryDescription)
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }
                    
                    if let secondaryDescription = viewModel.discResult?.secondary.description{
                        Text(secondaryDescription)
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }
                    
                    if let primaryPontosFortes = viewModel.discResult?.primary.pontosFortes{
                        Text("\(primaryPontosFortes)")
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }
                    
                    if let primaryPontosFracos = viewModel.discResult?.secondary.pontosFracos{
                        Text("\(primaryPontosFracos)")
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }
                    
                    if let blendDescription = viewModel.discResult?.blendDescription{
                        Text(blendDescription)
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }
                    
                    
                }
//                DiscDonutChartView(data: viewModel.chartData)
                DiscDonutChartView(viewModel: viewModel)
                
            } else {
                let question = viewModel.questions[viewModel.currentIndex]
                
                Text("Pergunta \(viewModel.currentIndex + 1) de \(viewModel.questions.count)")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                Text("Escolha uma opção que **mais** te representa e uma que **menos** te representa:")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                ForEach(question.options, id: \.self) { option in
                    HStack {
                        Text(option)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Button {
                            viewModel.mostSelected = option
                        } label: {
                            Image(systemName: viewModel.mostSelected == option ? "circle.fill" : "circle")
                        }
                        
                    }
                    .padding(.vertical, 4)
                }
                
                Button("Próxima") {
                    viewModel.select(most: viewModel.mostSelected)
                }
                .padding()
                .disabled(viewModel.mostSelected == nil)
            }
        }
        .padding()
        .animation(.easeInOut, value: viewModel.currentIndex)
    }
}

#Preview {
    DiscView()
}
