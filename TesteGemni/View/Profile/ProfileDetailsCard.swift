//
//  ProfileDetailsCard.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import SwiftUI

struct ProfileDetailsCard: View {
    
    var profilePic: UIImage
    var nmeProfile: String
    var jobDescribe: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(uiImage: profile.profilePic)
                .resizable()
                .scaledToFill()
                .frame(width: 54, height: 54)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(profile.nameProfile)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                
                Text(profile.jobDescribe)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
//            Spacer()
        }
    }
}

