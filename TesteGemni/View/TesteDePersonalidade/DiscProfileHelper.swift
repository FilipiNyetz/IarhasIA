//
//  DiscProfileHelper.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation

struct DiscProfileHelper {
    
    static func buildProfile(for code: String, from respostas: [DiscPontos]) -> DiscProfile {
            let name = styleName(code)
            let description = styleDescription(code)
            let pontos = selectPontosFortes(code, from: respostas)
            
            return DiscProfile(
                code: code,
                name: name,
                description: description,
                pontosFortes: pontos.fortes,
                pontosFracos: pontos.fracos
            )
        }

    
    static func styleName(_ style: String) -> String {
        switch style {
        case "D": return "Dominante (D)"
        case "I": return "Influente (I)"
        case "S": return "Estável (S)"
        case "C": return "Cauteloso (C)"
        default: return "Indefinido"
        }
    }
    
    static func styleDescription(_ style: String) -> String {
        switch style {
        case "D":
            return "Direto, determinado e orientado a resultados. Gosta de desafios e assumir o controle."
        case "I":
            return "Comunicativo, otimista e entusiasmado. Valoriza conexões sociais e motivação."
        case "S":
            return "Calmo, paciente e leal. Prefere estabilidade, cooperação e ambientes previsíveis."
        case "C":
            return "Analítico, preciso e disciplinado. Busca segurança através de regras e qualidade."
        default:
            return ""
        }
    }
    
    static func blendFeedback(for blend: String) -> String {
        switch blend {
        case "D/I":
            return "Combina foco em resultados (D) com carisma e energia (I). Ideal para liderar e inspirar equipes."
        case "I/S":
            return "Une empatia e sociabilidade (I) com estabilidade e harmonia (S) — ótimo em equipes colaborativas."
        case "S/C":
            return "Mistura paciência e consistência (S) com atenção a detalhes (C) — excelente para funções de suporte e qualidade."
        case "C/D":
            return "Combina precisão técnica (C) com assertividade (D) — ideal para liderança técnica e análise estratégica."
        case "D/C":
            return "Equilibra determinação (D) com rigor e método (C) — prático e exigente, busca resultados sólidos."
        case "I/D":
            return "Carismático e competitivo — inspira e influencia com autoconfiança."
        case "S/I":
            return "Agradável e cooperativo — gosta de ajudar e manter um clima positivo."
        case "C/S":
            return "Cuidadoso e confiável — ideal para ambientes estruturados e colaborativos."
        default:
            return "Perfil equilibrado e multifacetado — adapta-se bem a diferentes contextos."
        }
    }
    
    static func selectPontosFortes(_ style: String, from pontos: [DiscPontos]) -> DiscPontos {
        switch style {
        case "D": return pontos[0]
        case "I": return pontos[1]
        case "S": return pontos[2]
        case "C": return pontos[3]
        default: return DiscPontos(fortes: [""], fracos: [""])
        }
    }
}
