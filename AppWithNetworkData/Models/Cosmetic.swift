//
//  Cosmetic.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import Foundation

struct Cosmetic: Codable {
    struct Eyeshadow: Codable {
        let brand: String?
        let name: String?
        let price: Int?
        let image_link: String?
    }
    
    struct Lipstick: Codable {
        let brand: String?
        let name: String?
        let price: Int?
        let image_link: String?
    }
}

enum UserAction: String, CaseIterable {
    case eyeshadow = "Eyeshadow"
    case lipstick = "Lipstick"
}


