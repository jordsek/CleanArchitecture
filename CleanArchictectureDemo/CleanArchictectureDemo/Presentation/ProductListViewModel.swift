//
//  ProductListViewModel.swift
//  CleanArchictectureDemo
//
//  Created by Jor . on 02/02/2023.
//

import Foundation
@MainActor
class ProductListViewModel: ObservableObject{
    
    @Published var products: [Product] = []
    @Published var error: NetworkError?

    private let repository: ProductListRepository
   
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
   
    
    
}

extension ProductListViewModel: ProductListUseCase{
    func getDataForProducts(urlString: String) async {
        guard let url = URL(string: urlString) else{
            DispatchQueue.main.async {
                self.error = .invalidURL
            }
            return
        }
        do {
            let productData = try await repository.getProducts(for: url)
            products = productData.products
        }catch let capturedError {
            error = capturedError as? NetworkError
        }
    }
    
    
}
