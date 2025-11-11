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
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito tributário", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 5, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post1")!),
    
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post2")!),
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post2")!),
    ProfilePostMock(nameProfile: "Rafaela Santos", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post2")!)
]
