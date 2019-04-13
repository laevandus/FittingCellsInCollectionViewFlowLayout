//
//  CollectionViewController.swift
//  FittingCellsInCollectionViewFlowLayout
//
//  Created by Toomas Vahter on 11/04/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {

    let content: [String]
    
    init(content: [String]) {
        self.content = content
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: Collection View Data Source

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TextCollectionViewCell
        cell.textLabel.text = content[indexPath.item]
        return cell
    }
}

final class TextCollectionViewCell: UICollectionViewCell {
    let textLabel: UILabel
    
    override init(frame: CGRect) {
        textLabel = {
            let label = UILabel(frame: .zero)
            label.adjustsFontForContentSizeCategory = true
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        super.init(frame: frame)
        contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        contentView.layer.borderColor = UIColor.darkGray.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
