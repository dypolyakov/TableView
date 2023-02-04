//
//  TableViewCell.swift
//  CodeTableView
//
//  Created by Dmitry Polyakov on 05.02.2023.
//

import UIKit

// MARK: - TableViewController
final class FighterCell: UITableViewCell {
    
    // MARK: - Private Properties
    private let image = UIImageView()
    private let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func set(fighter: Fighter) {
        image.image = UIImage(named: fighter.image)
        label.text = fighter.name
    }
    
}

// MARK: - Setup View
private extension FighterCell {
    func setupView() {
        addSubviews()
        
        setupImage()
        setupLabel()
        
        setupLayout()
    }
}

// MARK: - Setting
private extension FighterCell {
    func addSubviews() {
        [image, label].forEach {
            addSubview($0)
        }
    }
    
    func setupImage() {
        image.contentMode = .scaleAspectFit
    }
    
    func setupLabel() {
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
    }
}

// MARK: - Layout
private extension FighterCell {
    func setupLayout() {
        [image, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            image.heightAnchor.constraint(equalToConstant: 140),
            image.widthAnchor.constraint(equalToConstant: 90),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 80),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
