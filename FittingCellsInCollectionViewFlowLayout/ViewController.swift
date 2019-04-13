//
//  ViewController.swift
//  FittingCellsInCollectionViewFlowLayout
//
//  Created by Toomas Vahter on 11/04/2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let content: [String] = ["Apples", "Oranges", "Bananas", "Grapefruits", "Lemons", "Apricots", "Cherries", "Pears", "Mandarins", "Plums", "Kiwis", "Coconuts"]
        let collectionViewController = CollectionViewController(content: content)
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionViewController.view)
        addChild(collectionViewController)
        NSLayoutConstraint.activate([
            collectionViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            collectionViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            ])
    }


}

