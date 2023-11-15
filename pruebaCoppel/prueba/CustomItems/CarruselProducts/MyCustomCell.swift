//
//  MyCustomCell.swift
//  prueba
//
//  Created by Kevin alvarez on 15/11/23.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    
    lazy var addToCartIcon: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var storeDeliveryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "store")
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        return image
    }()
    
    lazy var homeDeliveryIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "home-delivery")
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        return image
    }()
    
    lazy var discountPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.9)
        
        return label
    }()
    
    lazy var finalPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
        return label
    }()
    
    lazy var countedPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Precio contado:"
        label.textColor = .gray.withAlphaComponent(0.8)
        
        return label
    }()
    
    lazy var productDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        
        return label
    }()
    
    lazy var availabilityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        [
            profileImage,
            availabilityView,
            productDescription,
            countedPrice,
            finalPrice,
            discountPrice,
            homeDeliveryIcon,
            storeDeliveryIcon,
            addToCartIcon
        ].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            profileImage.trailingAnchor.constraint(equalTo: trailingAnchor),

            availabilityView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            availabilityView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),

            productDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            productDescription.topAnchor.constraint(equalTo: availabilityView.bottomAnchor, constant: 8),

            countedPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            countedPrice.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 8),

            finalPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            finalPrice.topAnchor.constraint(equalTo: countedPrice.bottomAnchor, constant: 8),

            discountPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            discountPrice.centerXAnchor.constraint(equalTo: finalPrice.centerXAnchor),

            homeDeliveryIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            homeDeliveryIcon.topAnchor.constraint(equalTo: finalPrice.bottomAnchor, constant: 8),

            storeDeliveryIcon.leadingAnchor.constraint(equalTo: homeDeliveryIcon.trailingAnchor, constant: 8),
            storeDeliveryIcon.centerXAnchor.constraint(equalTo: homeDeliveryIcon.centerXAnchor),

            addToCartIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addToCartIcon.centerXAnchor.constraint(equalTo: homeDeliveryIcon.centerXAnchor),
        ])
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
