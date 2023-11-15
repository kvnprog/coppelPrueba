//
//  LoginViewController.swift
//  prueba
//
//  Created by kevin alvarez on 12/11/23.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, DelegateSendText {
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView(delegate: self)
    }

    func sendText(email: String, password: String) {
        loginViewModel.login(email: email, password: password, completionBlock: { result in
            switch result {
            case .success(_):
                let viewHome = HomeViewController()
                 if let navController = self.navigationController {
                     navController.pushViewController(viewHome, animated: true)
                 }
            case .failure(let failure):
                print("Error: ", failure.localizedDescription)
            }
        })
    }
}
