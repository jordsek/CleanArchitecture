//
//  ProductListRepository.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//

import Foundation

protocol ProductListRepository{
    func getProducts(for url:URL) async throws -> ProductData
}
