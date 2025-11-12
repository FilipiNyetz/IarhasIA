//
//  TagFlowView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 12/11/25.
//
import SwiftUI

struct TagFlowView: View {
    let items: [String]
    var isWeakness: Bool = false
    var onTap: ((String) -> Void)? = nil

    let minItemWidth: CGFloat = 110
    let spacing: CGFloat = 10
    let fixedHeight: CGFloat = 44 // altura uniforme das tags

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { proxy in
            let totalWidth = proxy.size.width
            let tentativeColumns = Int((totalWidth + spacing) / (minItemWidth + spacing))
            let maxColumns = max(1, tentativeColumns)
            let itemWidth = floor((totalWidth - CGFloat(maxColumns - 1) * spacing) / CGFloat(maxColumns))

            let columns = Array(repeating: GridItem(.fixed(itemWidth), spacing: spacing), count: maxColumns)

            LazyVGrid(columns: columns, alignment: .center, spacing: spacing) {
                ForEach(items, id: \.self) { item in
                    TraitTagView(text: item, isWeakness: isWeakness) {
                        onTap?(item)
                    }
                    .frame(width: itemWidth, height: fixedHeight)
                }
            }
            .background(
                GeometryReader { geo in
                    // Atualiza altura dinamicamente
                    Color.clear
                        .onAppear { totalHeight = geo.size.height }
                        .onChange(of: geo.size.height) {_, newHeight in
                            totalHeight = newHeight
                        }
                }
            )
            .padding(.vertical, 4)
        }
        // Altura se ajusta dinamicamente ao conteúdo medido
        .frame(height: totalHeight)
    }
}

