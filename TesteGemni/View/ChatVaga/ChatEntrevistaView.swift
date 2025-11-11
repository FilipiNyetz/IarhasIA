//
//  ChatEntrevista.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI
import GoogleGenerativeAI

struct ChatEntrevista: View {
    
    @StateObject var chatVm = ChatViewModel(manager: ManagerChat())
    
    var body: some View {
        ZStack {
            // 1. Fundo suave para toda a view
            Color.indigo.opacity(0.05).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                // 2. Título e Subtítulo
                VStack {
                    Text("🤖 AI Job Interview Trainer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.indigo)
                    
                    Text("Analise suas capacidades técnicas")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top)
                
                // 3. Área do Chat (com auto-scroll)
                ScrollViewReader { proxy in
                    ScrollView {
                        Text(chatVm.response)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading) // Alinha o texto à esquerda
                            .id("bottomAnchor") // Âncora para o scroll
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 5, y: 5)
                    .onChange(of: chatVm.response) {
                        // Animação para rolar para baixo a cada nova mensagem
                        withAnimation {
                            proxy.scrollTo("bottomAnchor", anchor: .bottom)
                        }
                    }
                }
                
                // 4. Área de Input (dividida pela lógica 'isTraining')
                if !chatVm.isTraining {
                    // Estado inicial: Inserir a descrição da vaga
                    VStack(spacing: 15) {
                        Text("Cole a descrição da vaga")
                            .font(.headline)
                            .foregroundColor(.indigo)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("Cole aqui a descrição da vaga...", text: $chatVm.jobDescription, axis: .vertical)
                            .lineLimit(5...10)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.indigo.opacity(0.3), lineWidth: 1)
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
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.indigo)
                            .controlSize(.large)
                            .disabled(chatVm.jobDescription.isEmpty) // Desativa se o campo estiver vazio
                        }
                    }
                    .padding()
                    .background(.thinMaterial) // Efeito de "vidro"
                    .cornerRadius(20)
                    
                } else {
                    // Estado de treino: Chat ativo
                    HStack(spacing: 12) {
                        TextField("Sua resposta...", text: $chatVm.userPrompt, axis: .vertical)
                            .lineLimit(1...5) // Permite que o campo cresça
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(25) // Formato de pílula
                        
                        if chatVm.isLoading {
                            ProgressView()
                                .frame(width: 44, height: 44) // Tamanho do botão
                        } else {
                            Button(action: chatVm.sendResponse) {
                                Image(systemName: "paperplane.fill")
                                    .font(.system(size: 20))
                            }
                            .padding(12)
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .clipShape(Circle()) // Botão de envio circular
                            .disabled(chatVm.userPrompt.isEmpty) // Desativa se o campo estiver vazio
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(30) // Raio grande para acompanhar a cápsula interna
                }
            }
            .padding(.horizontal)
        }
    }
}
