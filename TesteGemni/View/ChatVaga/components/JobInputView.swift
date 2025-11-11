//
//  JobInputView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct JobInputView: View {
    @ObservedObject var chatVm: ChatViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Cole a descrição da vaga")
                .font(.headline)
                .foregroundColor(.text)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField(
                "Cole aqui a descrição da vaga...",
                text: $chatVm.jobDescription,
                axis: .vertical
            )
            .lineLimit(5...10)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.text.opacity(0.3), lineWidth: 1)
            )

            if chatVm.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding()
            } else {
                Button(action: chatVm.startTraining) {
                    Text("Iniciar Treino")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .tint(.text)
                .controlSize(.large)
                .disabled(chatVm.jobDescription.isEmpty)
            }
        }
        .padding()
        .background(Color.card)
        .cornerRadius(20)
    }
}
