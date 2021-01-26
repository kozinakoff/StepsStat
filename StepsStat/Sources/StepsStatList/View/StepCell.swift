//
//  StepCell.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 26.01.2021.
//

import UIKit

class StepCell: UICollectionViewCell {
    
    static let reuseID = "StepCell"
    
    private let textLabel = TitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(step: Step) {
        textLabel.text = "Step: \(step.step)"

    }
    
    override func prepareForReuse() {
        textLabel.text = nil
    }
    
    private func configure() {
        addSubviews(textLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            textLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
