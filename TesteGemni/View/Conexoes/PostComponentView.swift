//
//  PostComponentView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI
import UIKit  // Mantido porque você usa UIImage

struct PostComponentView: View {
    var imageProfile: UIImage
    var nameProfile: String
    var jobDescribe: String
    var datePost: Date
    var subtitlePost: String
    var imagePost: UIImage
    @State var isLiked: Bool
    var totalComments: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Perfil + nome + cargo
            HStack(alignment: .top, spacing: 10) {
                Image(uiImage: imageProfile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(nameProfile)
                        .font(.system(size: 15, weight: .semibold))
                    Text(jobDescribe)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    Text(datePost, style: .relative)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                Spacer()
            }

            Text(subtitlePost)
                .font(.system(size: 14))
                .foregroundColor(.primary)
                .padding(.top, 4)

            Image(uiImage: imagePost)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .clipped()

                .frame(maxWidth: .infinity)

            HStack(spacing: 8) {
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                        .font(.system(size: 20))
                })

                HStack(spacing: 6) {

                    Image(systemName: "bubble.right")
                        .foregroundColor(.gray)
                        .font(.system(size: 20))

                    Text("\(totalComments)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                }
            }
            .padding(.top, 4)
        }

        .padding(.vertical, 12)
        .background(Color.white.opacity(0.01))
        .cornerRadius(12)

    }
}
