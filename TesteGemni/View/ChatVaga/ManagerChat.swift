import Foundation
import GoogleGenerativeAI

protocol ManagerChatProtocol {
    func startTraining(jobDescription: String, prompt: String) async throws -> String
    func sendMessage(_ message: String) async throws -> String
}

final class ManagerChat: ManagerChatProtocol {
    private let model = GenerativeModel(name: "gemini-2.5-flash", apiKey: "AIzaSyCHpjF2DBZRi3S2pqEYTk7MIsep-fSMuTA")
    private var chat: Chat?
    
    func startTraining(jobDescription: String, prompt: String) async throws -> String {
        chat = model.startChat(history: [
            try ModelContent(role: "user", parts: [
                "\(prompt)\nDescrição da vaga: \(jobDescription)"
            ])
        ])
        
        guard let chat else { return "Erro ao iniciar o chat." }
        
        let result = try await chat.sendMessage("Analise a vaga e inicie as perguntas técnicas.")
        print(result.text!)
        return result.text ?? "Erro ao gerar perguntas."
    }
    
    func sendMessage(_ message: String) async throws -> String {
        guard let chat else { return "Chat não inicializado." }
        let result = try await chat.sendMessage(message)
        return result.text ?? "Erro ao gerar resposta."
    }
}
