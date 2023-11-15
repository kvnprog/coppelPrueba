//
//  CarruselProducts.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import Foundation
import UIKit

class CarruselBrands: UIView {
    
    private var carruselContentBrandCellModel: [CarruselContentBrandCellModel] = [CarruselContentBrandCellModel]()
    
    lazy var carruselBrands = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CarruselContentBrandCell.self, forCellWithReuseIdentifier: CarruselContentBrandCell.identifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    init(){
        super.init(frame: .zero)
        buildUI()
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView(carruselContentBrandCellModel: [CarruselContentBrandCellModel]) {
        self.carruselContentBrandCellModel = carruselContentBrandCellModel
        carruselBrands.reloadData()
    }
    
    func buildUI() {
        addSubview(carruselBrands)

        NSLayoutConstraint.activate([
            carruselBrands.topAnchor.constraint(equalTo: topAnchor),
            carruselBrands.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselBrands.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselBrands.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CarruselBrands: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carruselContentBrandCellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarruselContentBrandCell.identifier, for: indexPath) as? CarruselContentBrandCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: carruselContentBrandCellModel[indexPath.row])
        return cell
    }
}

extension CarruselBrands: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
