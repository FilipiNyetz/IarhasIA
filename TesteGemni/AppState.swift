//
//  AppState.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import Foundation
import SwiftUI
import Combine

class AppState: ObservableObject {
    
    @Published var selectedTab: Int = 0
    @Published var jobDescriptionToPaste: String? = nil // O dado a ser enviado

}
