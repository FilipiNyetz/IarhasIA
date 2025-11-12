//
//  HomeView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // --- Background ---
            Image("backgrounImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // --- Conteúdo Principal ---
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Início")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.text)
                        Text("12 de nov de 2025")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color.data)
                    }

                    Spacer()
                    Image(systemName: "person.circle")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundStyle(Color.data)
                }
                .padding(.bottom, 10)
                .padding(.horizontal)
                //.offset(y: -10)

                Image("fraseHome")
                    .resizable()
                    .frame(width: 360, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Vagas que combinam com você")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.black)

                    Text(
                        "Com base no resultado do seu teste de perfil comportamental"
                    )
                    .font(.system(size: 13, weight: .thin))
                    .foregroundStyle(.black)
                }
                .padding()

                VStack(alignment: .leading, spacing: 10) {
                    VagaHeaderView(imageName: "vaga1", jobTitle: "Advogado(a) Junior", companyName: "YG - Yassaga Garcia Sociedade de Advogados")
                    VagaHeaderView(imageName: "vaga2", jobTitle: "Assistente de Recursos Humanos", companyName: "Armando Costa Advogados")
                    VagaHeaderView(imageName: "vaga3", jobTitle: "Estagiário Direito Cível", companyName: "Catarina Michele Sociedade")
                    VagaHeaderView(imageName: "vaga4", jobTitle: "Advogado(a) Junior", companyName: "YG - Yassaga Garcia Sociedade de Advogados")
                
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)

            }

        }
        .padding(.horizontal)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
