//
//  ChatEntrevista.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import GoogleGenerativeAI
import SwiftUI

struct ChatEntrevista: View {

    @StateObject var chatVm = ChatViewModel(manager: ManagerChat())

    var body: some View {
        NavigationStack {
            ZStack {
                // 1. Fundo 100% da Tela
                Image("backgroundImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)

                VStack(spacing: 15) {
                    // 3. Área do Chat (ScrollViewReader)
                    ScrollViewReader { proxy in
                        ScrollView {
                            if !chatVm.isTraining {
                                Text(chatVm.response)
                                    .font(.title3)
                                    .padding()
                                    .frame(
                                        maxWidth: .infinity,
                                        alignment: .leading
                                    )
                                    .id("bottomAnchor")
                            } else {
                                VStack(spacing: 8) {
                                    ForEach(chatVm.messages) { message in
                                        ChatBubbleView(message: message)
                                            .id(message.id)
                                    }
                                    Rectangle().fill(Color.clear).frame(
                                        height: 1
                                    ).id("bottomAnchor")
                                }
                                .padding(.top, 10)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 5, y: 5)
                        .frame(
                            height: !chatVm.isTraining ? 100 : nil,
                            alignment: .top
                        )
                        .frame(maxWidth: .infinity)

                        // Lógica do Scroll
                        .onChange(
                            of: chatVm.isTraining
                                ? chatVm.messages.count
                                : (chatVm.response.isEmpty ? 0 : 1)
                        ) { _, _ in
                            withAnimation {
                                proxy.scrollTo("bottomAnchor", anchor: .bottom)
                            }
                        }

                    }

                    // 4. Área de Input (alterna entre input de vaga e input de chat)
                    if !chatVm.isTraining {
                        JobInputView(chatVm: chatVm)
                    } else {
                        ChatInputView(chatVm: chatVm)
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 60)

            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    VStack(alignment: .leading, spacing: 0) {  // Adicionado VStack para o subtítulo
                        Text("Iarhas IA")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.text)

                    }
                    .offset(y: 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)

        }

    }

    struct ChatBubbleView: View {
        let message: Message

        var body: some View {
            HStack {
                if !message.isUser {

                    Text(message.text)
                        .font(.body)
                        .padding(12)
                        .background(Color.iaMessage)
                        .foregroundColor(.black)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15,
                                style: .continuous
                            )
                        )
                        .frame(maxWidth: 320, alignment: .leading)
                        .multilineTextAlignment(.leading)

                    Spacer()

                } else {

                    Spacer()

                    Text(message.text)
                        .font(.body)
                        .padding(12)
                        .background(Color.card)
                        .foregroundColor(.black)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15,
                                style: .continuous
                            )
                        )
                        .frame(maxWidth: 320, alignment: .trailing)
                        .multilineTextAlignment(.trailing)

                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 2)
        }
    }
}

#Preview {
    ChatEntrevista()
}
