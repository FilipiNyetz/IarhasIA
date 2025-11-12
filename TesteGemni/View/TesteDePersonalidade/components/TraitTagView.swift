//
//  TraitTagView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct TraitTagView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(Color.black)
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
        
            .overlay(
                Capsule()
                    .stroke(Color.title, lineWidth: 1.5) // Contorno
            )
    }
}
