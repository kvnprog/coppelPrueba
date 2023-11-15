//
//  HomeViewController.swift
//  prueba
//
//  Created by kevin alvarez on 13/11/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
   
    // private var viewModels: [CarruselCellModel]?
    private var viewModel: HomeViewModel?
    let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "homeScreen"
        self.view = homeView
        viewModel = HomeViewModel(delegate: self, delegateProduct: self, delegateBrand: self)
    }
}

extension HomeViewController: CarruselDataNetworkProduct {
    func data(error: Error?, carruselArray: [CarruselContentCellModel]) {
        if error != nil { return }

        homeView.invokeBuildCarruselCollection(carruselContentCellModel: carruselArray)
    }
}

extension HomeViewController: CarruselDataNetworkBrand {
    func data(error: Error?, carruselArray: [CarruselContentBrandCellModel]) {
        if error != nil { return }

        homeView.invokeBuildCarruselBrandCollection(carruselContentCellBrandModel: carruselArray)
        
    }
}


extension HomeViewController: CarruselDataNetwork {
    func data(error: Error?, carruselArray: [CarruselContentCellProductModel]) {
        if error != nil { return }

        homeView.invokeBuildCarruselproductCollection(carruselContentCellProductModel: carruselArray)
    }
}


