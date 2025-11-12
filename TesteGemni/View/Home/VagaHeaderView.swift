//
//  VagaHeaderView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct VagaHeaderView: View {
    let imageName: String
    let jobTitle: String
    let companyName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) { // O VStack envolve o HStack e o Divider
            HStack {
                Image(imageName) // Usa a imagem dinâmica
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(jobTitle) // Usa o título dinâmico
                        .font(.system(size: 14, weight: .medium))
                    
                    Text(companyName) // Usa o nome da empresa dinâmico
                        .font(.system(size: 12, weight: .regular))
                }
                Spacer()
            }
            .padding() // Padding aplicado ao redor do HStack
            
            Divider()
        }
        // Este padding de 0 ajuda a remover o espaçamento vertical extra da VStack
        .padding(.vertical, 0)
    }
}
