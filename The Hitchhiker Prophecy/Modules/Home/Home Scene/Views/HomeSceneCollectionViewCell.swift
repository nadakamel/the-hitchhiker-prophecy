//
//  HomeSceneCollectionViewCell.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 18/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class HomeSceneCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    
    var character: HomeScene.Search.ViewModel! {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!

    // MARK: - Update UI
    private func updateUI() {
        if let character = character {
            characterNameLabel.text = character.name
            if let url = URL(string: character.imageUrl) {
                characterImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeHolder"))
            } else {
                characterImageView.image = UIImage(named:"placeHolder")
            }
        } else {
            characterNameLabel.text = nil
            characterImageView.image = nil
        }
        characterImageView.layer.cornerRadius = 10.0
        characterImageView.layer.masksToBounds = true
    }
    
}
