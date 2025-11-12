//
//  VagaHeaderView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct VagaHeaderView: View {
    let imageName: String
    let jobTitle: String
    let companyName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) { // O VStack envolve o HStack e o Divider
            HStack {
                Image(imageName) // Usa a imagem dinâmica
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(jobTitle) // Usa o título dinâmico
                        .font(.system(size: 14, weight: .medium))
                    
                    Text(companyName) // Usa o nome da empresa dinâmico
                        .font(.system(size: 12, weight: .regular))
                }
                Spacer()
            }
            .padding() // Padding aplicado ao redor do HStack
            
            Divider()
        }
        // Este padding de 0 ajuda a remover o espaçamento vertical extra da VStack
        .padding(.vertical, 0)
    }
}

// JobDetail Model (Você deve adicionar esta struct ao seu projeto)
struct JobDetail: Identifiable {
    let id = UUID()
    let imageName: String
    let jobTitle: String
    let companyName: String
    let location: String
    let summary: String
    let requirements: String
    let differentials: String
    let aboutCompany: String
    let companyActivity: String
}

// Dados Mock (Exemplo para a primeira vaga)
let mockJobs = [
    // Vaga 1 (Exemplo Original)
    JobDetail(
        imageName: "vaga1",
        jobTitle: "Advogado Pleno em Direito Tributário",
        companyName: "YG - Yassaga Garcia Sociedade de Advogados",
        location: "Brasília, Distrito Federal, Brasil",
        summary: "Advogado com experiência em Direito Tributário",
        requirements: "Inscrição regular na OAB;\nExperiência mínima de 2 (dois) anos como advogado;\nVivência no contencioso administrativo e judicial tributário.",
        differentials: "Pós-graduação em Direito Tributário e/ou Processual Civil;\nFamiliaridade com contencioso estratégico de empresas de grande porte;\nCapacidade de leitura crítica de autuações fiscais, com habilidade para analisar documentos contábeis, identificando as estratégias de defesa adequadas ao caso.",
        aboutCompany: "É um escritório jurídico que une excelência técnica, inovação e compromisso com a diversidade. Atuamos em diversas áreas do Direito, promovendo soluções estratégicas e humanas para um mercado mais justo, inclusivo e eficiente. Acreditamos que o sucesso jurídico está diretamente ligado à diversidade de ideias, trajetórias e experiências.",
        companyActivity: "Atividades jurídicas - 11 - 50 funcionários - 20 no larhas"
    ),
    
    // --- Vaga 2: Assistente de Recursos Humanos ---
    JobDetail(
        imageName: "vaga2",
        jobTitle: "Assistente de Recursos Humanos",
        companyName: "Armando Costa Advogados",
        location: "São Paulo, São Paulo, Brasil",
        summary: "Suporte administrativo e operacional em rotinas de Recursos Humanos, focado no setor jurídico.",
        requirements: "Graduação em curso (Administração, RH, ou Direito);\nExperiência prévia com rotinas de DP (folha de pagamento, admissão/demissão);\nConhecimento básico da CLT.",
        differentials: "Conhecimento em softwares de gestão de RH (ex: Sienge);\nCapacidade de comunicação interpessoal e organização impecável;\nFoco em gestão de conflitos e cultura organizacional.",
        aboutCompany: "Armando Costa Advogados é um escritório boutique especializado em direito corporativo, buscando a excelência na gestão de seus colaboradores para refletir no atendimento ao cliente.",
        companyActivity: "Serviços jurídicos - 6 - 10 funcionários - 5 no larhas"
    ),
    
    // --- Vaga 3: Estagiário Direito Cível ---
    JobDetail(
        imageName: "vaga3",
        jobTitle: "Estagiário Direito Cível",
        companyName: "Catarina Michele Sociedade",
        location: "Rio de Janeiro, Rio de Janeiro, Brasil",
        summary: "Estágio de 6 horas diárias em contencioso cível, com foco em direito do consumidor e imobiliário.",
        requirements: "Estar cursando entre o 4º e 7º período de Direito;\nCarteira de Estagiário OAB (ou aptidão para tirar);\nBoa redação e proatividade em diligências.",
        differentials: "Experiência prévia em peticionamento eletrônico (PJe, e-SAJ);\nFamiliaridade com pesquisa jurisprudencial e doutrinária;\nDisponibilidade para eventuais visitas a fóruns.",
        aboutCompany: "Catarina Michele Sociedade é um escritório de médio porte com atuação consolidada em grandes capitais, valorizando o aprendizado e o crescimento profissional de seus estagiários.",
        companyActivity: "Serviços jurídicos e consultoria - 20 - 40 funcionários - 15 no larhas"
    ),
    
    // --- Vaga 4: Advogado(a) Junior (Vaga Simples, para teste de alinhamento) ---
    JobDetail(
        imageName: "vaga4",
        jobTitle: "Advogado(a) Junior",
        companyName: "YG - Yassaga Garcia Sociedade de Advogados",
        location: "São Paulo, São Paulo, Brasil",
        summary: "Vaga de Advogado(a) Junior, área de Contratos e Compliance.",
        requirements: "OAB Ativa;\nExperiência em análise e redação de contratos;\nConhecimento de LGPD.",
        differentials: "Especialização em Direito Digital;\nFluência em Inglês.",
        aboutCompany: "É um escritório jurídico que une excelência técnica, inovação e compromisso com a diversidade. Atuamos em diversas áreas do Direito, promovendo soluções estratégicas e humanas para um mercado mais justo, inclusivo e eficiente. Acreditamos que o sucesso jurídico está diretamente ligado à diversidade de ideias, trajetórias e experiências.",
        companyActivity: "Atividades jurídicas - 11 - 50 funcionários - 20 no larhas"
    )
]
