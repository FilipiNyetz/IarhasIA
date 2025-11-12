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
    var list: [String]?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(Font.headline)
                .foregroundStyle(Color.title)
                .fontWeight(.semibold)

            if let list = list {
                ForEach(list, id: \.self) { item in
                    HStack{
                        Button(action: {
                            print()
                        }, label: {
                            TraitTagView(text: item)
                        })
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}
