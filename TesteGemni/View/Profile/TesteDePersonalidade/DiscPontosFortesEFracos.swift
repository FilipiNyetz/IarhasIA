//
//  DiscPontosFortesEFracos.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation


struct DiscPontos:Identifiable{
    let id = UUID()
    let fortes: [String]
    let fracos: [String]
}

struct ResumePontos{
    static let respostas: [DiscPontos] = [
        DiscPontos(fortes: ["Determinado", "Competitivo", "Decisivo", "Corajoso"], fracos: ["Parecer arrogante", "Impaciente", "Correr muitos riscos", "Falar sem pensar", "Ser insensível às pessoas"]),
        DiscPontos(fortes: ["Persuasivo", "Político", "Atencioso", "Sociável", "Entusiasmado"], fracos: ["Prolixo", "Pouco foco", "Falar muito rápido","Muito otimista", "Desorganizado"]),
        DiscPontos(fortes: ["Leal", "Estável", "Planejador", "Calmo", "Servidor"], fracos: ["Sem muita ambição", "Resistência a mudança", "Passivo demais", "Se apega muito", "Pouco expansível"]),
        DiscPontos(fortes: ["Sistemático", "Perfeccionista", "Pensa objetivamente","Busca alto padrão de qualidade", "Consciente"], fracos: ["Evita riscos", "Inflexível", "Muito crítico", "Busca muitos dados", "Detalhista ao extremo"])
    ]
}
