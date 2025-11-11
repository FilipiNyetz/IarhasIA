//
//  ChatViewModel.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation
import Combine

@MainActor
class ChatViewModel: ObservableObject {
    @Published var userPrompt: String = ""
//    @Published var systemPrompt: String = ""
    @Published var response: String = ""
    @Published var isTraining = false
    @Published var jobDescription: String = ""
    @Published var isLoading: Bool = false
    
    private let manager: ManagerChatProtocol
    private let basePrompt: String = promptCompleto
    private var questionCount = 0
    
    init(manager: ManagerChatProtocol = ManagerChat()) {
        self.manager = manager
    }
    
    func startTraining() {
        print("Entrou em start")
        Task {
            do {
                isTraining = true
                response = "Analisando a vaga e preparando perguntas..."
                let result = try await manager.startTraining(jobDescription: jobDescription, prompt: basePrompt)
                response = result
                print(result)
                // Só desativar o treino se a lógica interna determinar que acabou
                // isTraining = false
            } catch {
                response = "Erro: \(error.localizedDescription)"
                isTraining = false // erro => volta pro início
            }
        }
    }

    
    func sendResponse() {
        Task {
            guard !userPrompt.isEmpty else { return }
            isLoading = true
            do {
                questionCount += 1
                var result = try await manager.sendMessage(userPrompt)
                
                // Quando chegar à 10ª pergunta, gerar o feedback
                if questionCount >= 10 {
                    let feedback = try await manager.sendMessage("Agora gere um feedback completo sobre o desempenho do candidato.")
                    result += "\n\n💬 \(feedback)"
                    isTraining = false
                    questionCount = 0
                }
                
                response = result
                userPrompt = ""
            } catch {
                response = "Erro: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}
