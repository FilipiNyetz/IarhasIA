//
//  DiscPontosFortesEFracos.swift
//  TesteGemni
//
//  Created by Filipi Romão on 10/11/25.
//

import Foundation

// 1. CORREÇÃO: A struct DiscPontos deve ter 'fracos' como array de Strings
struct DiscPontos: Identifiable {
    let id = UUID()
    let fortes: [String]
    let fracos: [String] // Array de Strings (apenas os nomes dos pontos)
}

struct ResumePontos {
    static let respostas: [DiscPontos] = [
        // D - Dominante
        DiscPontos(
            fortes: ["Determinado", "Competitivo", "Decisivo", "Corajoso"],
            fracos: ["Parecer arrogante", "Impaciente", "Correr muitos riscos", "Falar sem pensar", "Ser insensível às pessoas"]
        ),
        
        // I - Influente
        // CORREÇÃO: Removendo o formato dicionário e ajustando itens.
        DiscPontos(
            fortes: ["Persuasivo", "Político", "Atencioso", "Sociável", "Entusiasmado"],
            fracos: ["Prolixo", "Pouco foco", "Falar muito rápido", "Muito otimista", "Desorganizado"]
        ),
        
        // S - Estável
        DiscPontos(
            fortes: ["Leal", "Estável", "Planejador", "Calmo", "Servidor"],
            fracos: ["Sem muita ambição", "Resistência a mudança", "Passivo demais", "Se apega muito", "Pouco expansível"]
        ),
        
        // C - Cauteloso
        DiscPontos(
            fortes: ["Sistemático", "Perfeccionista", "Pensa objetivamente", "Busca alto padrão de qualidade", "Consciente"],
            fracos: ["Evita riscos", "Inflexível", "Muito crítico", "Busca muitos dados", "Detalhista ao extremo"]
        )
    ]
}

// 2. DICIONÁRIO COMPLETO PARA ESTRATÉGIAS DE DESENVOLVIMENTO
struct WeaknessDevelopmentData {
    // Mapeamento de Ponto Fraco -> Texto de Desenvolvimento
    static let descriptions: [String: String] = [
        // --- D - Dominante ---
        "Parecer arrogante": "Trabalhe a escuta ativa e valide as opiniões dos outros antes de apresentar suas conclusões. Lembre-se que confiança é diferente de superioridade.",
        "Impaciente": "Pratique a respiração profunda e estabeleça prazos intermediários para reduzir a ansiedade. Tente delegar tarefas menores para focar no quadro geral.",
        "Correr muitos riscos": "Sempre peça uma 'segunda opinião' em decisões críticas. Desenvolva um checklist de mitigação de riscos antes de agir impulsivamente.",
        "Falar sem pensar": "Use a regra dos 5 segundos: respire antes de responder. Prepare frases como 'Isso é interessante, vou pensar um pouco sobre isso.'",
        "Ser insensível às pessoas": "Pratique se colocar no lugar do outro (empatia). Lembre-se de elogiar publicamente e criticar em particular.",
        
        // --- I - Influente ---
        "Prolixo": "Use a técnica 'elevator pitch': comece com a conclusão. Estruture suas falas com três pontos principais (máximo).",
        "Pouco foco": "Trabalhe em ambientes com menos distrações. Use o método Pomodoro (foco de 25 minutos) para manter a atenção.",
        "Falar muito rápido": "Grave-se falando para identificar o ritmo. Conscientemente, faça pausas entre as frases para respirar e dar tempo ao ouvinte.",
        "Muito otimista": "Ao planejar, adicione sempre uma margem de segurança de 20% para imprevistos. Envolva pessoas 'C' (cautelosas) no processo de planejamento.",
        "Desorganizado": "Use ferramentas digitais para gerenciar tarefas e prazos. Dedique 15 minutos ao final do dia para organizar o plano do dia seguinte.",
        
        // --- S - Estável ---
        "Sem muita ambição": "Defina metas de desenvolvimento profissional claras e mensuráveis (SMART). Procure projetos que o tirem da zona de conforto (com suporte).",
        "Resistência a mudança": "Encare a mudança como uma oportunidade de aprendizado. Crie um 'Plano de Ação para a Mudança' para ter controle sobre o processo.",
        "Passivo demais": "Pratique a assertividade começando por discordar de opiniões menores em reuniões. Defenda suas ideias com dados e fatos.",
        "Se apega muito": "Entenda que 'bom' é inimigo de 'ótimo'. Seja objetivo e desapegue de métodos antigos que já não são os mais eficientes.",
        "Pouco expansível": "Busque ativamente feedback construtivo. Participe de reuniões fora da sua área para aumentar seu horizonte de conhecimento.",
        
        // --- C - Cauteloso ---
        "Evita riscos": "Estabeleça um 'nível de risco aceitável' antes de iniciar um projeto. Lembre-se que 80% de precisão muitas vezes é suficiente para começar.",
        "Inflexível": "Pratique a adaptabilidade. Crie uma regra para si mesmo de aceitar 'X' sugestões dos colegas por semana, mesmo que não sejam perfeitas.",
        "Muito crítico": "Ao dar feedback, use a regra do sanduíche (elogio, crítica construtiva, elogio). Foque na solução, não apenas no problema.",
        "Busca muitos dados": "Estabeleça um prazo limite para a coleta de dados e force-se a tomar uma decisão com o que tem. O excesso de dados pode causar paralisia por análise.",
        "Detalhista ao extremo": "Delegue a revisão de detalhes para outros, focando apenas nas decisões de alto impacto. Lembre-se do objetivo final, não apenas do processo."
    ]
}
