//
//  CarruselProducts.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import Foundation
import UIKit

class CarruselProducts: UIView {
    
    private var carruselContentCellProductModel: [CarruselContentCellProductModel] = [CarruselContentCellProductModel]()
    
    lazy var carruselProducts = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CarruselContentProductCell.self, forCellWithReuseIdentifier: CarruselContentProductCell.identifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    init(){
        super.init(frame: .zero)
        buildUI()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildView(carruselContentCellProductModel: [CarruselContentCellProductModel]) {
        self.carruselContentCellProductModel = carruselContentCellProductModel
        carruselProducts.reloadData()
    }
    
    func buildUI() {
        addSubview(carruselProducts)

        NSLayoutConstraint.activate([
            carruselProducts.topAnchor.constraint(equalTo: topAnchor),
            carruselProducts.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselProducts.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselProducts.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CarruselProducts: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carruselContentCellProductModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarruselContentProductCell.identifier, for: indexPath) as? CarruselContentProductCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: carruselContentCellProductModel[indexPath.row])
        return cell
    }
}

extension CarruselProducts: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 340)
    }
}
