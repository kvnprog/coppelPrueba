//
//  HomeView.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    let labelTitleCategory: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Categorias"
        return label
    }()
    
    let carruselCategory: CarruselCategory = {
        let carrusel = CarruselCategory()
        carrusel.translatesAutoresizingMaskIntoConstraints = false
        return carrusel
    }()
    
    let labelTitleProducts: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Los predilectos mas vendidos"
        return label
    }()
    
    let carruselProduct: CarruselProducts = {
        let carrusel = CarruselProducts()
        carrusel.translatesAutoresizingMaskIntoConstraints = false
        return carrusel
    }()
    
    let labelTitleBrands: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .systemGray6
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Las mejores marcas"
        return label
    }()
    
    let carruselBrand: CarruselBrands = {
        let carrusel = CarruselBrands()
        carrusel.translatesAutoresizingMaskIntoConstraints = false
        return carrusel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        [labelTitleCategory,carruselCategory,labelTitleProducts,carruselProduct,labelTitleBrands,carruselBrand].forEach(addSubview)
        
        NSLayoutConstraint.activate ([
            labelTitleCategory.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelTitleCategory.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelTitleCategory.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            
            carruselCategory.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselCategory.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselCategory.topAnchor.constraint(equalTo: labelTitleCategory.bottomAnchor),
            carruselCategory.heightAnchor.constraint(equalToConstant: 150),
            
            labelTitleProducts.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelTitleProducts.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelTitleProducts.topAnchor.constraint(equalTo: carruselCategory.bottomAnchor, constant: 10),
            
            carruselProduct.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselProduct.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselProduct.topAnchor.constraint(equalTo: labelTitleProducts.bottomAnchor),
            carruselProduct.heightAnchor.constraint(equalToConstant: 370),
            
            labelTitleBrands.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelTitleBrands.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelTitleBrands.topAnchor.constraint(equalTo: carruselProduct.bottomAnchor, constant: 10),
            
            carruselBrand.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselBrand.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselBrand.topAnchor.constraint(equalTo: labelTitleBrands.bottomAnchor),
            carruselBrand.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func invokeBuildCarruselCollection(carruselContentCellModel: [CarruselContentCellModel]) {
        carruselCategory.buildView(carruselContentCellModel: carruselContentCellModel)
    }
    
    func invokeBuildCarruselproductCollection(carruselContentCellProductModel: [CarruselContentCellProductModel]) {
        carruselProduct.buildView(carruselContentCellProductModel: carruselContentCellProductModel)
    }
    
    func invokeBuildCarruselBrandCollection(carruselContentCellBrandModel: [CarruselContentBrandCellModel]) {
        carruselBrand.buildView(carruselContentBrandCellModel: carruselContentCellBrandModel)
    }
    
}
