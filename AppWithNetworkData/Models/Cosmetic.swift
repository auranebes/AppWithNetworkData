//
//  Cosmetic.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import Foundation

struct Cosmetic: Decodable {
    struct Eyeshadow: Codable {
        let id: Int?
        let brand: String?
        let name: String?
        let price: String?
        let price_sign: String?
        let currency: String?
        let image_link: String?
        let product_link: String?
        let website_link: String?
        let description: String?
      
        let category: String?
        let product_type: String?
        let tag_list: [String]?
        let created_at: String?
        let updated_at: String?
        let product_api_url: String?
        let api_featured_image: String?
        let product_colors: [ProductColors]?
    }
    
    struct Lipstick: Decodable {
        let id: Int?
        let brand: String?
        let name: String?
        let price: String?
        let price_sign: String?
        let currency: String?
        let image_link: String?
        let product_link: String?
        let website_link: String?
        let description: String?

        let category: String?
        let product_type: String?
        let tag_list: [String]?
        let created_at: String?
        let updated_at: String?
        let product_api_url: String?
        let api_featured_image: String?
        let product_colors: [ProductColors]?
    }
    
    struct ProductColors: Codable {
        let hex_value: String?
        let colour_name: String?
    }
}

enum UserAction: String, CaseIterable {
    case eyeshadow = "Eyeshadows"
    case lipstick = "Lipsticks"
}


