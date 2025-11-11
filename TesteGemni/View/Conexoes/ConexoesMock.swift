//
//  ConexoesMock.swift
//  TesteGemni
//
//  Created by Filipi Romão on 11/11/25.
//

import Foundation
import UIKit

struct ModelPostMock: Identifiable{
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


var postMocks: [ModelPostMock] = [
    ModelPostMock(nameProfile: "Joana Costa", jobDescribe: "Especialista em direito tributário", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 5, profilePic: UIImage(named: "JoanaCostaProfile")!, postImage: UIImage(named: "Post1")!),
    
    ModelPostMock(nameProfile: "Rafael Medeiros", jobDescribe: "Especialista em direito civil", postedAt: Date(), subTitle: "Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto Exemplo de texto de legenda da foto ", isLiked: false, numberOfComments: 10, profilePic: UIImage(named: "RafaelaSantosProfile")!, postImage: UIImage(named: "Post2")!)
]
