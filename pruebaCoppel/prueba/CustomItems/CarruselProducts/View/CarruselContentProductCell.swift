//
//  CarruselContentProductCell.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import UIKit

class CarruselContentProductCell: UICollectionViewCell {
    static let identifier = "CarruselContentProductCell"
    
    lazy var addToCartIcon: UIView = {
        let view = UIView()
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        
        image.image = UIImage(named: "shopping-cart")

        view.addSubview(image)

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            view.widthAnchor.constraint(equalToConstant: 30),

            image.heightAnchor.constraint(equalToConstant: 16),
            image.widthAnchor.constraint(equalToConstant: 16),

            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 51/255.0, green: 165/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        view.backgroundColor = .white
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
        label.textColor = .black.withAlphaComponent(0.4)
        
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
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            availabilityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            availabilityView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),

            productDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            productDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            productDescription.topAnchor.constraint(equalTo: availabilityView.bottomAnchor, constant: 8),

            countedPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            countedPrice.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 8),

            finalPrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            finalPrice.topAnchor.constraint(equalTo: countedPrice.bottomAnchor, constant: 8),

            discountPrice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            discountPrice.centerYAnchor.constraint(equalTo: finalPrice.centerYAnchor),

            homeDeliveryIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            homeDeliveryIcon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),

            storeDeliveryIcon.leadingAnchor.constraint(equalTo: homeDeliveryIcon.trailingAnchor, constant: 8),
            storeDeliveryIcon.centerYAnchor.constraint(equalTo: homeDeliveryIcon.centerYAnchor),

            addToCartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            addToCartIcon.centerYAnchor.constraint(equalTo: homeDeliveryIcon.centerYAnchor),
        ])
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
    func configure(with carruselModel: CarruselContentCellProductModel) {

        backgroundColor = .systemGray6
        DispatchQueue.main.async {
            guard let url = URL(string: carruselModel.image) else {
                return
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }

                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.profileImage.image = image
                    }
                }
            }

            task.resume()
        }

        productDescription.text = carruselModel.title
        if let discount = Int(carruselModel.descuento), let firstPrice = Int(carruselModel.precio) {
            let finalPrice = firstPrice - discount

            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale.current
            numberFormatter.maximumFractionDigits = 0

            if let formattedFinalPrice = numberFormatter.string(from: NSNumber(value: finalPrice)),
               let formattedFirstPrice = numberFormatter.string(from: NSNumber(value: firstPrice)) {
                self.finalPrice.text = formattedFinalPrice
                self.discountPrice.text = formattedFirstPrice
            } else {
                self.finalPrice.text = "$\(finalPrice)"
                self.discountPrice.text = "$\(firstPrice)"
            }
        }
    }
}
 
