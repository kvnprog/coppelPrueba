//
//  LoginViewControllerTests.swift
//  pruebaTests
//
//  Created by Kevin alvarez on 14/11/23.
//

import XCTest
import FirebaseAuth
@testable import prueba

final class LoginViewControllerTests: XCTestCase {
    
    var loginViewController: LoginViewController!
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        loginViewController = LoginViewController()
        viewModel = loginViewController.loginViewModel
    }

    override func tearDownWithError() throws {
        loginViewController = nil
        viewModel = nil
    }
    
    func testLoginSuccess() {
        // Arrange
        let username = "prueba@prueba.com"
        let password = "123456"
        let expectation = XCTestExpectation(description: "Login successful")
        
        // Act
        viewModel.login(email: username, password: password) { result in
            // Assert
            switch result {
            case .success(let user):
                XCTAssertEqual(user.email, username)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Login should succeed, but received error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testLoginFailure() {
        // Arrange
        let username = "prueba@prueba"
        let password = "123456789"
        let expectation = XCTestExpectation(description: "Login should fail")

        // Act
        viewModel.login(email: username, password: password) { result in
            // Assert
            switch result {
            case .success(let user):
                XCTFail("Login should fail, but received user: \(user)")
            case .failure(let error):
                XCTAssertNotNil(error, "Error should not be nil")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
