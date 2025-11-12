//
//  ChatEntrevista.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import GoogleGenerativeAI
import SwiftUI

struct ChatEntrevista: View {

    @ObservedObject var chatVm: ChatViewModel
    @EnvironmentObject var appState: AppState

    func checkAndPasteJobDescription() {
        if let description = appState.jobDescriptionToPaste {
            chatVm.jobDescription = description
            appState.jobDescriptionToPaste = nil
            // Opcional: Inicia o treino
            // chatVm.startTraining()
        }
    }

    var body: some View {
        ZStack {
            // 1. Fundo 100% da Tela
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)

            VStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Iarhas IA")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color.text)

                    Text("Analise suas capacidades técnicas")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 32)
                .frame(maxWidth: .infinity, alignment: .leading)

                // 3. Área do Chat (ScrollViewReader)
                ScrollViewReader { proxy in
                    ScrollView {
                        if !chatVm.isTraining {
                            Text(.init(chatVm.response))
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
            .onAppear(perform: checkAndPasteJobDescription)

            // 2. 🎯 CORREÇÃO CRÍTICA: Verifica sempre que a aba é selecionada
            .onChange(of: appState.selectedTab) { _, newTab in
                if newTab == 1 {  // Se for a aba do chat
                    checkAndPasteJobDescription()
                }
            }

        }

    }

    struct ChatBubbleView: View {
        let message: Message

        var body: some View {
            HStack {
                if !message.isUser {

                    Text(.init(message.text))
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
    // 1. Cria o AppState de mock
    let mockAppState = AppState()
    
    // 2. Passa o VM e injeta o AppState
    return ChatEntrevista(chatVm: ChatViewModel(manager: ManagerChat()))
        .environmentObject(mockAppState)
}
