//
//  CarruselCategory.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import Foundation
import UIKit

class CarruselCategory: UIView {
    
    private var carruselContentCellModel: [CarruselContentCellModel] = [CarruselContentCellModel]()
    
    lazy var carruselCategory = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CarruselContentCell.self, forCellWithReuseIdentifier: CarruselContentCell.identifier)
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
    
    func buildView(carruselContentCellModel: [CarruselContentCellModel]) {
        self.carruselContentCellModel = carruselContentCellModel
        carruselCategory.reloadData()
    }
    
    func buildUI() {
        addSubview(carruselCategory)

        NSLayoutConstraint.activate([
            carruselCategory.topAnchor.constraint(equalTo: topAnchor),
            carruselCategory.leadingAnchor.constraint(equalTo: leadingAnchor),
            carruselCategory.trailingAnchor.constraint(equalTo: trailingAnchor),
            carruselCategory.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CarruselCategory: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carruselContentCellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarruselContentCell.identifier, for: indexPath) as? CarruselContentCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: carruselContentCellModel[indexPath.row])
        return cell
    }
}

extension CarruselCategory: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
