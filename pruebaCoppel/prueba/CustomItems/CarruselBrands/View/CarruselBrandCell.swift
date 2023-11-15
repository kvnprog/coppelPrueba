//
//  CarruselBrandCell.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import UIKit

class CarruselBrandCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "CarruselBrandCell"
    
    private var carruselContentBrandCellModel: [CarruselContentBrandCellModel] = []
    
    private let  collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CarruselContentBrandCell.self, forCellWithReuseIdentifier: CarruselContentBrandCell.identifier)
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [collectionView].forEach(addSubview)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.frame.size.height = 80
        cell.frame.size.width = 80
        cell.backgroundColor = .red
        return cell

    }
    
    func configure(with viewModel: CarruselBrandCellModel){
        self.carruselContentBrandCellModel = viewModel.carruselContentBrandCellModel
        collectionView.reloadData()
    }
}
