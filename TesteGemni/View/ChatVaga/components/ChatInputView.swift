//
//  ChatInputView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct ChatInputView: View {
    @ObservedObject var chatVm: ChatViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            TextField(
                "Sua resposta...",
                text: $chatVm.userPrompt,
                axis: .vertical
            )
            .lineLimit(1...5)
            .padding(12)
            .background(Color.white)
            .cornerRadius(25)

            if chatVm.isLoading {
                ProgressView()
                    .frame(width: 44, height: 44)
            } else {
                Button(action: chatVm.sendResponse) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 20))
                }
                .padding(12)
                .background(Color.text)
                .foregroundColor(.white)
                .clipShape(Circle())
                .disabled(chatVm.userPrompt.isEmpty)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 24)
        .background(.thinMaterial)
        .cornerRadius(30)
    }
}
