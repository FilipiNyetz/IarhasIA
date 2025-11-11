//
//  ChatEntrevista.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import SwiftUI
import GoogleGenerativeAI

struct ChatEntrevista: View {
    
    @StateObject var chatVm = ChatViewModel(manager: ManagerChat())

        
        var body: some View {
            VStack {
                Text("🤖 AI Job Interview Trainer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                
                ScrollView {
                    Text(chatVm.response)
                        .font(.title3)
                        .padding()
                }
                
                if !chatVm.isTraining {
                    TextField("Cole aqui a descrição da vaga...", text: $chatVm.jobDescription, axis: .vertical)
                        .padding()
                        .background(Color.indigo.opacity(0.1))
                        .cornerRadius(15)
                    
                    Button("Iniciar treino") {
                        chatVm.startTraining()
                    }
                    .padding()
                } else {
                    TextField("Sua resposta...", text: $chatVm.userPrompt)
                        .padding()
                        .background(Color.indigo.opacity(0.1))
                        .cornerRadius(15)
                    
                    Button("Enviar") {
                        chatVm.sendResponse()
                    }
                    .padding()
                }
                
                if chatVm.isLoading {
                    ProgressView()
                }
            }
            .padding()
        }
        
    }



