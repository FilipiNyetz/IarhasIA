//
//  ResumeCard.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct ResumeCard: View {
    var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Resultado")
                .font(Font.headline)
                .foregroundStyle(Color.title)
                .fontWeight(.semibold)
            Text("\(text)")
                .font(.subheadline)
          
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}


