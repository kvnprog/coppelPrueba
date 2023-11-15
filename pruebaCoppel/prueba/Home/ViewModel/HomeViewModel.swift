//
//  HomeViewModel.swift
//  prueba
//
//  Created by Kevin alvarez on 14/11/23.
//

import Foundation

protocol CarruselDataNetwork: AnyObject {
    func data(error: Error?, carruselArray: [CarruselContentCellModel])
}

protocol CarruselDataNetworkProduct: AnyObject {
    func data(error: Error?, carruselArray: [CarruselContentCellProductModel])
}

protocol CarruselDataNetworkBrand: AnyObject {
    func data(error: Error?, carruselArray: [CarruselContentBrandCellModel])
}

final class HomeViewModel {
    
    let apiClient = APIClient()
    private weak var delegate: CarruselDataNetwork?
    
    let apiClientProduct = APIClientProduct()
    private weak var delegateProduct: CarruselDataNetworkProduct?
    
    let apiClientBrand = APIClientBrand()
    private weak var delegateBrand: CarruselDataNetworkBrand?
    
    init(delegate: CarruselDataNetwork?, delegateProduct: CarruselDataNetworkProduct?, delegateBrand: CarruselDataNetworkBrand?) {
        self.delegate = delegate
        apiConnection()
        
        self.delegateProduct = delegateProduct
        apiConnectionProduct()
        
        self.delegateBrand = delegateBrand
        apiConnectionBrand()
    }

    private func apiConnection() {
        apiClient.getDataCategoryFirebase(completion: { result in
            switch result {
            case .success(let success):
                if let firstValue = success.first {
                    let carruselArray: [CarruselContentCellModel] = firstValue.carruselContentCellModel
                    self.delegate?.data(error: nil, carruselArray: carruselArray)
                }
            case .failure(let failure):
                self.delegate?.data(error: failure, carruselArray: [])
                return
            }
        })
    }
    
    private func apiConnectionProduct() {
        apiClientProduct.getDataCategoryFirebase(completion: { result in
            switch result {
            case .success(let success):
                if let firstValue = success.first {
                    let carruselArray: [CarruselContentCellProductModel] = firstValue.carruselContentProductCellModel
                    self.delegateProduct?.data(error: nil, carruselArray: carruselArray)
                }
            case .failure(let failure):
                self.delegateProduct?.data(error: failure, carruselArray: [])
                return
            }
        })
    }
    
    private func apiConnectionBrand() {
        apiClientBrand.getDataCategoryFirebase(completion: { result in
            switch result {
            case .success(let success):
                if let firstValue = success.first {
                    let carruselArray: [CarruselContentBrandCellModel] = firstValue.carruselContentBrandCellModel
                    self.delegateBrand?.data(error: nil, carruselArray: carruselArray)
                }
            case .failure(let failure):
                self.delegateBrand?.data(error: failure, carruselArray: [])
                return
            }
        })
    }
}
