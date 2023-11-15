//
//  ViewController.swift
//  prueba
//
//  Created by kevin alvarez on 11/11/23.
//

import UIKit


class LoginView: UIView {
    
    weak var delegateSendText: DelegateSendText?

    private let logoImage: UIImageView = {
        let imagenView = UIImageView()
        imagenView.image = UIImage(named: "logo")
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        return imagenView
    }()
    
    private let labelWelcome: UILabel = {
        let label = UILabel()
        label.text = "¡HOLA!"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelIndicactions: UILabel = {
        let label = UILabel()
        label.text = "Inicia sesion con tu correo electronico"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textFieldEmail: TextFieldCustom = {
        let view = TextFieldCustom(placeHolder: "Correo electronico", type: .username)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let textFieldPassword: TextFieldCustom = {
        let view = TextFieldCustom(placeHolder: "Contraseña", type: .password)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelForgotPassword:UILabel = {
        let label = UILabel()
        label.text = "Olvide mi Contraseña"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var buttomSession: UIButton = { [weak self] in
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Iniciar Session"
        configuration.attributedTitle?.font = UIFont.boldSystemFont(ofSize: 10.0)
        
        let buttom = UIButton(type: .system)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.configuration = configuration
        buttom.tintColor = .naviBlue
        buttom.setTitleColor(.white, for: .normal)
        buttom.addTarget(self, action: #selector(self?.buttonClickSession), for: .touchUpInside)
        
        return buttom
    }()
    
    private let labelNoAccount: UILabel = {
        let label = UILabel()
        label.text = "¿No tienes cuenta?"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttomCreateAccount: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Crea tu cuenta"
        configuration.attributedTitle?.font = UIFont.boldSystemFont(ofSize: 10.0)
       
        let buttom = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            
        }))
        buttom.layer.borderWidth = 1.0
        buttom.layer.borderColor = UIColor.naviBlue.cgColor
        buttom.layer.cornerRadius = 8.0
        buttom.setTitleColor(.naviBlue, for: .normal)
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.configuration = configuration
        return buttom
    }()
    
    @objc
    func buttonClickSession(){
        //loginSession(email:  , password: textFieldPassword.getText())
        let email = textFieldEmail.textField.text ?? ""
        let password = textFieldPassword.textField.text ?? ""
        
        delegateSendText?.sendText(email: email, password: password)
    }
    
    init(delegate: DelegateSendText) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.delegateSendText = delegate
        [logoImage,
         labelWelcome,
         labelIndicactions,
         textFieldEmail,
        textFieldPassword,
        labelForgotPassword,
        buttomSession,
        labelNoAccount,
        buttomCreateAccount].forEach(addSubview)
        
        addConstraint()
        
              
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func addConstraint() {
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 25 ),
            logoImage.widthAnchor.constraint(equalToConstant: 120),
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 100 ),
            
            labelWelcome.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelWelcome.topAnchor.constraint(equalTo: logoImage.bottomAnchor , constant: 20),
            
            labelIndicactions.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelIndicactions.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant: 5),
            
            textFieldEmail.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldEmail.topAnchor.constraint(equalTo: labelIndicactions.bottomAnchor, constant: 20),
            textFieldEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            textFieldEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            textFieldPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            textFieldPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            textFieldPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            labelForgotPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelForgotPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            
            buttomSession.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttomSession.topAnchor.constraint(equalTo: labelForgotPassword.bottomAnchor, constant: 20),
            buttomSession.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            buttomSession.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttomSession.heightAnchor.constraint(equalToConstant: 35),
            
            labelNoAccount.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelNoAccount.topAnchor.constraint(equalTo: buttomSession.bottomAnchor, constant: 20),
            
            buttomCreateAccount.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttomCreateAccount.topAnchor.constraint(equalTo: labelNoAccount.bottomAnchor, constant: 20),
            buttomCreateAccount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            buttomCreateAccount.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttomCreateAccount.heightAnchor.constraint(equalToConstant: 35),
            
        ])
 
    }
    
  
    
}


