//
//  ProductListRepositoryImplementation.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//

import Foundation

final class ProductListRepositoryImplementation: ProductListRepository{
    
    let networkManager: Networkable
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getProducts(for url: URL) async throws -> ProductData {
        let data = try await self.networkManager.getDataFromAPI(url: url)
        let productData = try JSONDecoder().decode(ProductData.self, from: data)
        return productData
    }
    
    
}
