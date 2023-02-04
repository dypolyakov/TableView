//
//  ViewController.swift
//  CodeTableView
//
//  Created by Dmitry Polyakov on 05.02.2023.
//

import UIKit

// MARK: - View Controller
final class ViewController: UIViewController {
    
    // MARK: - Private Properties
    let tableView = UITableView()
    let fighters = getFighters()

    // MARK: - Override ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

// MARK: - Setup View
private extension ViewController {
    func setupView() {
        addSubviews()
        title = "UFC Fighters"
        
        setupTableViewDelegates()
        setupTableView()
        
        setupLayout()
    }
    
    
}

// MARK: - Setting
private extension ViewController {
    func addSubviews() {
        view.addSubview(tableView)
        
    }
    
    func setupTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupTableView() {
        tableView.rowHeight = 150
        tableView.register(FighterCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - Layout
private extension ViewController {
    func setupLayout() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
}
 
// MARK: - Delegate and DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fighters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FighterCell
        let fighter = fighters[indexPath.row]
        
        cell?.set(fighter: fighter)
        
        return cell ?? FighterCell()
    }
}
