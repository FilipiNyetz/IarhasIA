//
//  ProfileMock.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import Foundation
import UIKit

struct ProfileMock: Identifiable{
    var id: UUID = UUID()
    var nameProfile: String
    var jobDescribe: String
    var profilePic: UIImage
    var hasTestPersonal: Bool
}

struct ProfilePostMock: Identifiable{
    var id: UUID = UUID()
    var nameProfile: String
    var jobDescribe: String
    var postedAt: Date
    var subTitle: String
    var isLiked: Bool
    var numberOfComments: Int
    var profilePic: UIImage
    var postImage: UIImage
}

var profile = ProfileMock(nameProfile: "Rafaela Santos", jobDescribe: "Direito Penal", profilePic: UIImage(named: "RafaelaSantosProfile")!, hasTestPersonal: false)

var postsProfile: [ProfilePostMock] = [
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Que honra poder compartilhar conhecimento e trocar experiências em um evento tão inspirador, voltado para o protagonismo e a representatividade de mulheres negras! Foi um momento de conexão, aprendizado e celebração da força que temos quando ocupamos espaços que sempre foram nossos por direito", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Palestra")!),
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "É uma alegria imensa fazer parte de uma equipe formada por pessoas negras incríveis! Estar em um ambiente onde a diversidade é vivida de verdade e onde nossas vozes são valorizadas é algo transformador. Que essa jornada seja de aprendizado, crescimento e conquistas coletivas!", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post2")!),
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito tributário", postedAt: Date(), subTitle: "Hoje celebro não apenas a minha graduação, mas também o poder de chegar até aqui sendo uma mulher negra, consciente do meu valor e das portas que posso abrir para outras. Gratidão a todos que caminham comigo e inspiram essa jornada de conquistas e representatividade. ", isLiked: false, numberOfComments: 5, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post1")!),
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Reuniao")!),
   
]
