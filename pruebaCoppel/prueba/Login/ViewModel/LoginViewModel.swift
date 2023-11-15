//
//  LoginViewModel.swift
//  prueba
//
//  Created by kevin alvarez on 12/11/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel{
    
    func login(email: String, password: String, completionBlock: @escaping (Result<FirebaseAuth.User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error {
                completionBlock(.failure(err))
                return
            }
            
            if let result = result {
                completionBlock(.success(result.user))
            }
        }
    }
}
