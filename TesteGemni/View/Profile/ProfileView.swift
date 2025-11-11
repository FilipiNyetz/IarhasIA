//
//  ProfileView.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @State var testPerfilHasCompleted: Bool = false
    

    var body: some View {
        ZStack {
            Image("backgrounImg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
     
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Perfil")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color.text)
                        .padding(.top, 10)
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .opacity(0.6)
                        .padding(.top, 10)
                }
                .padding(.bottom, 25)
                
                ProfileDetailsCard(profilePic: profile.profilePic, nmeProfile: profile.nameProfile, jobDescribe: profile.jobDescribe)
                .padding(.bottom, 25)

                
                if !profile.hasTestPersonal {
                    CardProfileTest()
                }

                Divider()
                    .foregroundStyle(Color.text)
                
                Text("Minhas publicações")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom, 15)
                    .padding(.top, 10)

                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 25) {
                        ForEach(postsProfile) { post in
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
                    .padding(.bottom, 100)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
