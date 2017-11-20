//
//  Purchases.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 21/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

class PurchasesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setupNavigationBar () {
        
        navigationItem.title = "Purchase"
        
        let leftBarItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(dimissThisVC))
        navigationItem.leftBarButtonItem = leftBarItem
    }
    @objc
    private func dimissThisVC() {
        dismiss(animated: true, completion: nil)
    }
}
