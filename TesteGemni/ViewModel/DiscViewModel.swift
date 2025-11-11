//
//  DiscViewModel.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class DiscViewModel: ObservableObject {
    @Published var currentIndex = 0
    @Published var mostSelected: String? = nil
    @Published var finished = false
    @Published var introductionShown = false
    @Published var discResult: DiscResult? = nil


    @Published var result: [String: Int] = ["D": 0, "I": 0, "S": 0, "C": 0]
    
    let questions = DiscData.questions
    let respostas = ResumePontos.respostas
    
    // MARK: - Introduction Text
    let introductionText = """
    💡 **Teste DISC – Avaliação de Perfil Comportamental**

    Este teste mede suas tendências comportamentais segundo o método DISC.
    Não existem respostas certas ou erradas — o objetivo é **autoconhecimento**.

    Em cada grupo de frases, escolha:
    - ✅ A que **mais** representa você.
    - 🚫 A que **menos** representa você.
    """

    func select(most: String?) {
        guard let most = most else { return }
        let question = questions[currentIndex]
        guard let mostIndex = question.options.firstIndex(of: most) else { return }
        
        let mostFactor = question.factors[mostIndex]
        result[mostFactor, default: 0] += 1
        moveNext()
    }

    private func moveNext() {
        mostSelected = nil
                
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finished = true
            generateFeedback()
        }
    }

    private func generateFeedback() {
        let sorted = result.sorted { $0.value > $1.value }
        guard sorted.count >= 2 else { return }

        let primaryCode = sorted[0].key
        let secondaryCode = sorted[1].key
        let gap = sorted[0].value - sorted[1].value

        let primaryProfile = DiscProfileHelper.buildProfile(for: primaryCode, from: respostas)
        let secondaryProfile = DiscProfileHelper.buildProfile(for: secondaryCode, from: respostas)
        let blendText = DiscProfileHelper.blendFeedback(for: "\(primaryCode)/\(secondaryCode)")
        let balanced = gap < 2

        discResult = DiscResult(
            primary: primaryProfile,
            secondary: secondaryProfile,
            blendDescription: blendText,
            isBalanced: balanced
        )
    }

    var chartData: [DiscChartData] {
        result.map { DiscChartData(label: $0.key, value: $0.value) }
            .sorted { $0.label < $1.label }
    }


    func reset() {
        currentIndex = 0
        mostSelected = nil
        result = ["D": 0, "I": 0, "S": 0, "C": 0]
        finished = false
        introductionShown = false
        discResult = nil
    }
}

// MARK: - Chart Data Model
struct DiscChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Int
}

struct DiscResult {
    let primary: DiscProfile
    let secondary: DiscProfile
    let blendDescription: String
    let isBalanced: Bool
}

struct DiscProfile {
    let code: String
    let name: String
    let description: String
    let pontosFortes: [String]
    let pontosFracos: [String]
}
