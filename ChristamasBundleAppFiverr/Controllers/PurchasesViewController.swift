//
//  Purchases.swift
//  ChristamasBundleAppFiverr
//
//  Created by Christopher Brandon Karani on 21/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

class PurchasesViewController: UITableViewController {
    
    let tableLabels = ["Preview Sounds", "Purchase Sounds"]
    let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        
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

//DataSource
extension PurchasesViewController  {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableLabels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let label = tableLabels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = label
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension PurchasesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            handlePresentPreviewSongsController()
        }
        
    }
    
    private func handlePresentPreviewSongsController() {
        let previewSongsViewController = PreviewSongsController()
        navigationController?.pushViewController(previewSongsViewController, animated: true)
    }
}

// DELAGATE
