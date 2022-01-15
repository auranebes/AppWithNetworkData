//
//  NetworkManager.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import Foundation

class CosmeticsData {
    static let shared = CosmeticsData()
    
    let eyeShadowJSON = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=eyeshadow"
    let lipstickJSON = "http://makeup-api.herokuapp.com/api/v1/products.json?product_type=lipstick"
    
    private init() {}
}
