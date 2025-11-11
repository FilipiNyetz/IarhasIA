//
//  DescriptionCard.swift
//  TesteGemni
//
//  Created by Joao pedro Leonel on 11/11/25.
//

import Foundation
import SwiftUI

struct DescriptionCard: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(text)
                .font(.body)
                .lineSpacing(5)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

