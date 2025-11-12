//
//  TraitTagView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct TraitTagView: View {
    let text: String
    let isWeakness: Bool
    var action: (() -> Void)? = nil

    var body: some View {
        Group {
            if let action = action {
                Button(action: action) {
                    tagContent
                }
                .buttonStyle(.plain)
            } else {
                tagContent
            }
        }
    }

    private var tagContent: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .minimumScaleFactor(0.8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 6)
            .background(
                Capsule()
                    .stroke(Color.title)
            )
    }
}

