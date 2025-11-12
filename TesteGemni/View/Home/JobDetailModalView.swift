//
//  JobDetailModalView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct JobDetailModalView: View {
    @Environment(\.dismiss) var dismiss
    let job: JobDetail

    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .top) {
                            Image(job.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack(alignment: .leading) {
                                Text(job.companyName)
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                
                                Text(job.location)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        Divider()
                    }
                    
                    Group {
                        Text("Sobre a vaga")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.text)
                        
                        Text(job.summary)
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("REQUISITOS:")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text(job.requirements)
                            .font(.body)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom)
                        
                        Text("DIFERENCIAIS:")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text(job.differentials)
                            .font(.body)
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom)
                    }
                    
                    Group {
                        Text("Sobre a empresa")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.text)
                        
                        Text(job.companyName)
                            .font(.body)
                            .fontWeight(.medium) +
                        Text(" - " + job.companyActivity)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(job.aboutCompany)
                            .font(.body)
                            .lineSpacing(4)
                    }
                    
                    Button("Treinar entrevista para esta vaga") {
                        dismiss()
                        // Ação para iniciar o treino
                        // Você pode adicionar a lógica para iniciar a entrevista aqui
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.title)
                    .controlSize(.large)
                    .frame(maxWidth: .infinity)
                    
                }
                .padding()
        }.padding(.top, 25)
    }
}
