//
//  CarruselContentBrandCell.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import UIKit

class CarruselContentBrandCell: UICollectionViewCell {
    static let identifier = "CarruselContentBrandCell"
    
    private let stackContent:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.backgroundColor = .systemGray6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var circularBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 45
        view.layer.masksToBounds = true

        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6

        view.addSubview(profileImageView)

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 90),
            view.widthAnchor.constraint(equalToConstant: 90),

            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),

            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        view.backgroundColor = .white
        return view
    }()
    
    private lazy var contentViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circularBackgroundView)

        NSLayoutConstraint.activate([
            circularBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            circularBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(contentViewContainer)
        NSLayoutConstraint.activate([
            contentViewContainer.topAnchor.constraint(equalTo: topAnchor),
            contentViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            contentViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            contentViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
    func configure(with carruselModel: CarruselContentBrandCellModel) {
        
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
                        self.profileImageView.image = image
                    }
                }
            }

            task.resume()
        }
    }
}
 
