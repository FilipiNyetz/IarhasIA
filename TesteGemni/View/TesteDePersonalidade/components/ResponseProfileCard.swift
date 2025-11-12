//
//  ResponseProfileCard.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct ResponseProfileCard: View {
    var textPrimary: String
    var textSecondary: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Perfil Principal")
                .font(Font.headline)
                .foregroundStyle(Color.title)
                .fontWeight(.semibold)
            Text("\(textPrimary)")
                .font(.subheadline)
            Text("Perfil Secundário")
                .font(Font.headline)
                .foregroundStyle(Color.title)
                .fontWeight(.semibold)
            Text("\(textSecondary)")
                .font(.subheadline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}


