//
//  ConexoesView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct ConexoesView: View {
    @State private var search = ""

    var body: some View {
        ZStack {
            // --- Background ---
            Image("backgrounImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // --- Conteúdo Principal ---
            VStack(alignment: .leading, spacing: 0) {

                // 1. Título e Ícone
                HStack {
                    Text("Conexões")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color.text)
                    Spacer()
                    Image(systemName: "plus.circle")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(Color.text)
                }
                .padding(.top, 30)
                .padding(.bottom, 10)

                // 2. Campo de busca
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray.opacity(0.7))
                    
                    TextField("Pessoas, eventos...", text: $search)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 14) // Padding interno para o conteúdo do campo
                .background(Color.white.opacity(0.9))
                .cornerRadius(12)
                .padding(.bottom, 10) // Espaço abaixo do campo de busca

                // 3. Lista de posts
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 25) { // LazyVStack é mais eficiente para listas longas
                        ForEach(postMocks) { post in
                            PostComponentView(
                                imageProfile: post.profilePic,
                                nameProfile: post.nameProfile,
                                jobDescribe: post.jobDescribe,
                                datePost: post.postedAt,
                                subtitlePost: post.subTitle,
                                imagePost: post.postImage,
                                isLiked: post.isLiked,
                                totalComments: post.numberOfComments
                            )
                        }
                    }
                    // O conteúdo do ScrollView precisa de padding lateral
                    // para alinhar com o Título e o Campo de Busca
                    .padding(.bottom, 76) // Espaço na parte inferior
                }
                // .padding(.vertical, 0) // Opcional: remove padding vertical extra do ScrollView
            }
            // 🚨 SOLUÇÃO PARA O ALINHAMENTO: Aplique o padding horizontal aqui.
            .padding(.horizontal)
        }
    }
}


#Preview {
    ConexoesView()
}
