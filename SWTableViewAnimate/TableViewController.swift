//
//  TableViewController.swift
//  SWTableViewAnimate
//
//  Created by John Lima on 08/10/16.
//  Copyright © 2016 limadeveloper. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    private let numberOfRows = 100
    private let numberOfSections = 1
    private let cellIdentifier = "cell"
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
        self.animateTable()
    }
    
    // MARK: - Actions
    private func updateUI() {
        
        let background = UIView(frame: .zero)
        self.tableView.tableFooterView = background
        self.tableView.backgroundColor = .white
    }
    
    private func animateTable() {
    
        self.tableView.reloadData()
        
        let cells = self.tableView.visibleCells
        let tableHeight = self.tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var delayCounter = 0
        
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { 
                cell.transform = .identity
                cell.textLabel?.textColor = UIColor.randomColor()
                }, completion: nil)
            delayCounter += 1
        }
        
    }
    
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "Effect \(indexPath.row + 1)"
        
        return cell
    }

    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
