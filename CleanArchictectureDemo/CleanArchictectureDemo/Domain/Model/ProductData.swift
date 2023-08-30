//
//  ProductData.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//

import Foundation

struct ProductData: Codable{
    let products:[Product]
}

struct Product: Codable, Identifiable{
    let id, price: Int
    let title, description: String
}
