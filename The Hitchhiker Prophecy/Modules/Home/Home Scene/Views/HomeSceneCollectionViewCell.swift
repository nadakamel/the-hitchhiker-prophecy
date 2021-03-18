//
//  HomeSceneCollectionViewCell.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 17/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeSceneCollectionViewCell: UICollectionViewCell {
    
    let imageHeight: CGFloat = 500.0
    
    fileprivate lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeHolder")
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 10),
            characterNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            characterNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            characterNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        characterImageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        
    }
    
    func configCell(character: HomeScene.Search.ViewModel) {
        characterNameLabel.text = character.name
        if let url = URL(string: character.imageUrl) {
            characterImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeHolder"))
        } else {
            characterImageView.image = UIImage(named:"placeHolder")
        }
    }
    
}
