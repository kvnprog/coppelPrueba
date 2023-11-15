//
//  TextFiledCustom.swift
//  prueba
//
//  Created by kevin alvarez on 12/11/23.
//

import Foundation
import UIKit

protocol DelegateSendText: AnyObject{
    func sendText(email: String, password: String)
}

enum TextFieldType {
    case username
    case password
}

class TextFieldCustom: UIView, UITextFieldDelegate {
    
    var placeHolder: String
    var type: TextFieldType
    
    private var showPassword: Bool = false
    private var passTextFieldImage = UIImage(systemName: "eye.slash.fill") {
        didSet {
            iconImage.image = passTextFieldImage
            textField.isSecureTextEntry = !showPassword
        }
    }
    
    private var underLine: UIView = {
        let underline = UIView()
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underline.backgroundColor = .gray
        
        return underline
    }()

    var textField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var iconImage: UIImageView = { [weak self] in
        let image = UIImageView()
        let onTapGesture = UITapGestureRecognizer(target: self, action: #selector(self?.configPassVisibility(_:)))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = self?.passTextFieldImage
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(onTapGesture)
        
        return image
    }()
    
    init(placeHolder: String, type: TextFieldType) {
        self.placeHolder = placeHolder
        self.type = type
        super.init(frame: .zero)
        buildTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildTextField() {
        
        textField.placeholder = placeHolder
        
        switch type {
        case .username:
            usernameUI()
        case .password:
            passwordUI()
        }
    }
    
    private func passwordUI() {
        textField.isSecureTextEntry = true
        [
            textField,
            iconImage,
            underLine
        ].forEach(addSubview(_:))
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: iconImage.leadingAnchor, constant: -8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            iconImage.heightAnchor.constraint(equalToConstant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            iconImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            underLine.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 4),
            underLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            underLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ])
    }
    
    private func usernameUI() {
        [
            textField,
            underLine
        ].forEach(addSubview(_:))
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            underLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            underLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            underLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ])
    }
    
    @objc
    private func configPassVisibility(_ onTapGesture: UITapGestureRecognizer) {
        showPassword.toggle()
        passTextFieldImage = showPassword ? UIImage(systemName: "eye.fill") : UIImage(systemName: "eye.slash.fill")
        setNeedsLayout()
        layoutIfNeeded()
    }
}
