//
//  WeaknessDetailModal.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 12/11/25.
//

import SwiftUI

struct WeaknessDetailModal: View {
    let title: String
    let developmentText: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.title) // Adapte a cor
            
            Text("Estratégia de Desenvolvimento:")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(developmentText)
                .font(.body)
                .lineSpacing(6)
            
            Spacer()
            
            // Botão de fechar (opcional, já que o usuário pode arrastar)
            Button("Entendi") {
                // O dismiss será chamado pela View pai
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.title)
            .controlSize(.large)
            .frame(maxWidth: .infinity)
            
        }
        .padding(30)
    }
}

