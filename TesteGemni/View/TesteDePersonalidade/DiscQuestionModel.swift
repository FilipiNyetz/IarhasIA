//
//  DiscQuestion.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation

struct DiscQuestion: Identifiable {
    let id = UUID()
    let options: [String]
    let factors: [String] // ["D", "I", "S", "C"]
}

struct DiscData {
    static let questions: [DiscQuestion] = [
        DiscQuestion(options: ["Determinado", "Sociável", "Calmo", "Preciso"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Aventureiro", "Otimista", "Ponderado", "Cauteloso"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Competitivo", "Comunicativo", "Estável", "Cuidadoso"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Decidido", "Alegre", "Amigável", "Perfeccionista"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Independente", "Inspirador", "Gentil", "Metódico"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Persistente", "Entusiasta", "Tranquilo", "Organizado"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Resoluto", "Persuasivo", "Leal", "Criterioso"], factors: ["D", "I", "S", "C"]),
        DiscQuestion(options: ["Corajoso", "Simpático", "Equilibrado", "Conformado"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Prático", "Extrovertido", "Agradável", "Sistemático"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Seguro", "Divertido", "Calmo", "Cauteloso"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Decisivo", "Conversador", "Tolerante", "Analítico"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Direto", "Animado", "Constante", "Disciplinado"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Arrojado", "Expressivo", "Sereno", "Detalhista"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Assertivo", "Afável", "Paciente", "Rigoroso"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Competente", "Carismático", "Equilibrado", "Cuidadoso"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Autoconfiante", "Encantador", "Prestativo", "Controlado"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Inovador", "Empolgado", "Compreensivo", "Conservador"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Assertivo", "Comunicativo", "Paciente", "Crítico"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Firme", "Alegre", "Calmo", "Detalhado"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Determinado", "Inspirador", "Leal", "Metódico"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Desafiador", "Sociável", "Amável", "Exato"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Competitivo", "Animado", "Tranquilo", "Cauteloso"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Corajoso", "Amigável", "Sereno", "Detalhista"], factors: ["D", "I", "S", "C"]),
//        DiscQuestion(options: ["Dominante", "Motivador", "Cooperativo", "Disciplinado"], factors: ["D", "I", "S", "C"])
    ]
}


